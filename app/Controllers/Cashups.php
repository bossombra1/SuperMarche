<?php

namespace App\Controllers;

use App\Models\Cashup;
use App\Models\Expense;
use App\Models\Reports\Summary_payments;
use CodeIgniter\HTTP\ResponseInterface;
use Config\OSPOS;
use Config\Services;

class Cashups extends Secure_Controller
{
    private Cashup $cashup;
    private Expense $expense;
    private Summary_payments $summary_payments;
    private array $config;

    public function __construct()
    {
        parent::__construct('cashups');

        $this->cashup = model(Cashup::class);
        $this->expense = model(Expense::class);
        $this->summary_payments = model(Summary_payments::class);
        $this->config = config(OSPOS::class)->settings;
    }

    /**
     * @return string
     */
    public function getIndex(): string
    {
        $data['table_headers'] = get_cashups_manage_table_headers();

        // filters that will be loaded in the multiselect dropdown
        $data['filters'] = ['is_deleted' => lang('Cashups.is_deleted')];

        // Restore filters from URL
        $data = array_merge($data, restoreTableFilters($this->request));

        $logged_in_employee = $this->employee->get_logged_in_employee_info();
        $data['is_admin'] = $this->employee->isAdmin($logged_in_employee->person_id);

        return view('cashups/manage', $data);
    }

    /**
     * @return void
     */
    public function getSearch(): ResponseInterface
    {
        $search = $this->request->getGet('search');
        $limit = $this->request->getGet('limit', FILTER_SANITIZE_NUMBER_INT);
        $offset = $this->request->getGet('offset', FILTER_SANITIZE_NUMBER_INT);
        $sort = $this->sanitizeSortColumn(cashup_headers(), $this->request->getGet('sort', FILTER_SANITIZE_SPECIAL_CHARS), 'cashup_id');
        $order = $this->request->getGet('order', FILTER_SANITIZE_SPECIAL_CHARS);
        $filters = [
            'start_date' => $this->request->getGet('start_date', FILTER_SANITIZE_SPECIAL_CHARS),    // TODO: Is this the best way to filter dates
            'end_date'   => $this->request->getGet('end_date', FILTER_SANITIZE_SPECIAL_CHARS),
            'is_deleted' => false
        ];

        // Check if any filter is set in the multiselect dropdown
        $request_filters = array_fill_keys($this->request->getGet('filters', FILTER_SANITIZE_SPECIAL_CHARS) ?? [], true);
        $filters = array_merge($filters, $request_filters);
        $cash_ups = $this->cashup->search($search, $filters, $limit, $offset, $sort, $order);
        $total_rows = $this->cashup->get_found_rows($search, $filters);
        $data_rows = [];
        $logged_in_employee = $this->employee->get_logged_in_employee_info();
        $allow_edit = $this->employee->isAdmin($logged_in_employee->person_id);

        foreach ($cash_ups->getResult() as $cash_up) {
            $data_rows[] = get_cash_up_data_row($cash_up, $allow_edit);
        }

        return $this->response->setJSON(['total' => $total_rows, 'rows' => $data_rows]);
    }

    /**
     * @param int $cashup_id
     * @return string
     */
    public function getView(int $cashup_id = NEW_ENTRY): string
    {
        $data = [];

        $data['employees'] = [];
        foreach ($this->employee->get_all()->getResult() as $employee) {
            foreach (get_object_vars($employee) as $property => $value) {
                $employee->$property = $value;
            }

            $data['employees'][$employee->person_id] = $employee->first_name . ' ' . $employee->last_name;
        }

        $cash_ups_info = $this->cashup->get_info($cashup_id);

        foreach (get_object_vars($cash_ups_info) as $property => $value) {
            $cash_ups_info->$property = $value;
        }

        // Open cashup
        if ($cash_ups_info->cashup_id == NEW_ENTRY) {
            $logged_in_employee = $this->employee->get_logged_in_employee_info();
        $is_admin = $this->employee->isAdmin($logged_in_employee->person_id);

        // Only administrators may modify or delete cashup sessions.
        if ($cashup_id !== NEW_ENTRY) {
            $existing = $this->cashup->get_info($cashup_id);

            if ($this->cashup->is_closed($cashup_id) && !$is_admin) {
                return $this->response->setJSON(['success' => false, 'message' => 'Cette session est fermée. Seul un administrateur peut la corriger.', 'id' => $cashup_id]);
            }

            if (!$this->cashup->is_closed($cashup_id)) {
                $is_owner = ((int) $existing->open_employee_id === (int) $logged_in_employee->person_id);

                if (!$is_admin && !$is_owner) {
                    return $this->response->setJSON(['success' => false, 'message' => 'Vous ne pouvez pas modifier la session d\'un autre employé.', 'id' => $cashup_id]);
                }

                $closeRequested = $this->request->getPost('close_session') === '1';

                if (!$is_admin && !$closeRequested) {
                    return $this->response->setJSON(['success' => false, 'message' => 'La modification d\'une session ouverte est réservée à l\'administrateur.', 'id' => $cashup_id]);
                }

                if ($closeRequested && !$is_admin && !$is_owner) {
                    return $this->response->setJSON(['success' => false, 'message' => 'Vous ne pouvez fermer que votre propre session.', 'id' => $cashup_id]);
                }
            }
        }


            if ($this->cashup->has_open_cashup($logged_in_employee->person_id)) {
                $data['open_cashup_warning'] = 'Une session de caisse est déjà ouverte.';
            }

            $cash_ups_info->open_date = date('Y-m-d H:i:s');
            $cash_ups_info->close_date = null;
            $cash_ups_info->open_employee_id = $logged_in_employee->person_id;
            $cash_ups_info->close_employee_id = null;
            $cash_ups_info->status = 0;
        }
        // If all the amounts are null or 0 that means it's a close cashup
        elseif (
            floatval($cash_ups_info->closed_amount_cash) == 0
            && floatval($cash_ups_info->closed_amount_due) == 0
            && floatval($cash_ups_info->closed_amount_card) == 0
            && floatval($cash_ups_info->closed_amount_check) == 0
        ) {
            // Set the close date and time to the actual as this is a close session
            $cash_ups_info->close_date = date('Y-m-d H:i:s');

            // The closed amount starts with the open amount -/+ any trasferred amount
            $cash_ups_info->closed_amount_cash = $cash_ups_info->open_amount_cash + $cash_ups_info->transfer_amount_cash;

            if ($cash_ups_info->cashup_id != NEW_ENTRY && $this->cashup->has_linked_sales($cash_ups_info->cashup_id)) {
                $totals = $this->cashup->get_linked_payment_totals($cash_ups_info->cashup_id);
                $cash_ups_info->closed_amount_cash += $totals['cash'];
                $cash_ups_info->closed_amount_due += $totals['due'];
                $cash_ups_info->closed_amount_card += $totals['card'];
                $cash_ups_info->closed_amount_check += $totals['check'];
            } else {
                // If it's date mode only and not date & time truncate the open and end date to date only
                if (empty($this->config['date_or_time_format'])) {
                    if ($cash_ups_info->open_date != null) {
                        $start_date = substr($cash_ups_info->open_date, 0, 10);
                    } else {
                        $start_date = null;
                    }
                    if ($cash_ups_info->close_date != null) {
                        $end_date = substr($cash_ups_info->close_date, 0, 10);
                    } else {
                        $end_date = null;
                    }
                    // Search for all the payments given the time range
                    $inputs = [
                        'start_date'  => $start_date,
                        'end_date'    => $end_date,
                        'sale_type'   => 'complete',
                        'location_id' => 'all'
                    ];
                } else {
                    // Search for all the payments given the time range
                    $inputs = [
                        'start_date'  => $cash_ups_info->open_date,
                        'end_date'    => $cash_ups_info->close_date,
                        'sale_type'   => 'complete',
                        'location_id' => 'all'
                    ];
                }

                // Get all the transactions payment summaries
                $reports_data = $this->summary_payments->getData($inputs);

                foreach ($reports_data as $row) {
                    if ($row['trans_group'] == lang('Reports.trans_payments')) {
                        if ($row['trans_type'] == lang('Sales.cash')) {
                            $cash_ups_info->closed_amount_cash += $row['trans_amount'];
                        } elseif ($row['trans_type'] == lang('Sales.due')) {
                            $cash_ups_info->closed_amount_due += $row['trans_amount'];
                        } elseif (
                            $row['trans_type'] == lang('Sales.debit') ||
                            $row['trans_type'] == lang('Sales.credit')
                        ) {
                            $cash_ups_info->closed_amount_card += $row['trans_amount'];
                        } elseif ($row['trans_type'] == lang('Sales.check')) {
                            $cash_ups_info->closed_amount_check += $row['trans_amount'];
                        }
                    }
                }
            }

            // Lookup expenses paid in cash
            $filters = [
                'start_date' => $cash_ups_info->open_date,
                'end_date'   => $cash_ups_info->close_date,
                'is_deleted' => false
            ];
            $filters = [
                'only_cash'   => true,
                'only_due'    => false,
                'only_check'  => false,
                'only_credit' => false,
                'only_debit'  => false,
                'is_deleted'  => false
            ];

            $payments = $this->expense->get_payments_summary('', array_merge($inputs, $filters));

            foreach ($payments as $row) {
                $cash_ups_info->closed_amount_cash -= $row['amount'];
            }

            $cash_ups_info->closed_amount_total = $this->_calculate_total($cash_ups_info->open_amount_cash, $cash_ups_info->transfer_amount_cash, $cash_ups_info->closed_amount_cash, $cash_ups_info->closed_amount_due, $cash_ups_info->closed_amount_card, $cash_ups_info->closed_amount_check);
        }

        $data['cash_ups_info'] = $cash_ups_info;

        return view("cashups/form", $data);
    }

    /**
     * @param int $row_id
     * @return ResponseInterface
     */
    public function getRow(int $row_id): ResponseInterface
    {
        $cash_ups_info = $this->cashup->get_info($row_id);
        $data_row = get_cash_up_data_row($cash_ups_info);

        return $this->response->setJSON($data_row);
    }

    /**
     * @param int $cashup_id
     * @return ResponseInterface
     */
    public function postSave(int $cashup_id = NEW_ENTRY): ResponseInterface
    {
        if ($cashup_id === NEW_ENTRY) {
            return $this->response->setJSON(['success' => false, 'message' => 'Les sessions de caisse s\'ouvrent depuis Ventes.', 'id' => NEW_ENTRY]);
        }


        // Prevent modifying an already closed session.
        if ($cashup_id !== NEW_ENTRY && $this->cashup->is_closed($cashup_id)) {
            return $this->response->setJSON(['success' => false, 'message' => 'Cette session de caisse est fermée et ne peut plus être modifiée.', 'id' => $cashup_id]);
        }

        // Prevent opening a second session for the same employee.
        if ($cashup_id === NEW_ENTRY && $this->cashup->has_open_cashup($logged_in_employee->person_id)) {
            return $this->response->setJSON(['success' => false, 'message' => 'Une session de caisse est déjà ouverte pour cet employé.', 'id' => NEW_ENTRY]);
        }

        $existing = $this->cashup->get_info($cashup_id);

        $open_amount_cash     = parse_decimals($this->request->getPost('open_amount_cash'));
        $transfer_amount_cash = parse_decimals($this->request->getPost('transfer_amount_cash'));
        $closed_amount_cash   = parse_decimals($this->request->getPost('closed_amount_cash'));
        $closed_amount_due    = parse_decimals($this->request->getPost('closed_amount_due'));
        $closed_amount_card   = parse_decimals($this->request->getPost('closed_amount_card'));
        $closed_amount_check  = parse_decimals($this->request->getPost('closed_amount_check'));

        $existing = $this->cashup->get_info($cashup_id);

        $transfer_amount_cash = parse_decimals($this->request->getPost('transfer_amount_cash'));
        $closed_amount_cash   = parse_decimals($this->request->getPost('closed_amount_cash'));
        $closed_amount_due    = parse_decimals($this->request->getPost('closed_amount_due'));
        $closed_amount_card   = parse_decimals($this->request->getPost('closed_amount_card'));
        $closed_amount_check  = parse_decimals($this->request->getPost('closed_amount_check'));

        $closeRequested = $this->request->getPost('close_session') === '1';
        $is_closed = $closeRequested
            || (float) $closed_amount_cash !== 0.0
            || (float) $closed_amount_due !== 0.0
            || (float) $closed_amount_card !== 0.0
            || (float) $closed_amount_check !== 0.0;

        // Preserve opening values from the database.
        $open_date = !empty($existing->open_date) ? $existing->open_date : date('Y-m-d H:i:s');
        $open_employee_id = !empty($existing->open_employee_id) ? (int) $existing->open_employee_id : $logged_in_employee->person_id;
        $open_amount_cash = (float) $existing->open_amount_cash;

        $close_date = null;
        $close_employee_id = null;

        if ($is_closed) {
            $close_date = date('Y-m-d H:i:s');
            $close_employee_id = $logged_in_employee->person_id;
        } elseif (!empty($existing->close_date)) {
            $close_date = $existing->close_date;
            $close_employee_id = $existing->close_employee_id;
        }

        $cash_up_data = [
            'open_date'            => $open_date,
            'close_date'           => $close_date,
            'open_amount_cash'     => $open_amount_cash,
            'transfer_amount_cash' => $transfer_amount_cash,
            'closed_amount_cash'   => $closed_amount_cash,
            'closed_amount_due'    => $closed_amount_due,
            'closed_amount_card'   => $closed_amount_card,
            'closed_amount_check'  => $closed_amount_check,
            'closed_amount_total'  => $this->_calculate_total($open_amount_cash, $transfer_amount_cash, $closed_amount_due, $closed_amount_cash, $closed_amount_card, $closed_amount_check),
            'note'                 => $this->request->getPost('note') != null,
            'description'          => $this->request->getPost('description', FILTER_SANITIZE_SPECIAL_CHARS),
            'open_employee_id'     => $open_employee_id,
            'close_employee_id'    => $close_employee_id,
            'deleted'              => $this->request->getPost('deleted') != null,
            'status'               => $is_closed ? 1 : 0,
        ];

        if ($this->cashup->save_value($cash_up_data, $cashup_id)) {
            if ($cashup_id == NEW_ENTRY) {
                return $this->response->setJSON(['success' => true, 'message' => lang('Cashups.successful_adding'), 'id' => $cash_up_data['cashup_id']]);
            } else {
                return $this->response->setJSON(['success' => true, 'message' => lang('Cashups.successful_updating'), 'id' => $cashup_id]);
            }
        } else {
            return $this->response->setJSON(['success' => false, 'message' => lang('Cashups.error_adding_updating'), 'id' => NEW_ENTRY]);
        }
    }

    /**
     * @return ResponseInterface
     */
    public function postDelete(): ResponseInterface
    {
        $logged_in_employee = $this->employee->get_logged_in_employee_info();

        if (!$this->employee->isAdmin($logged_in_employee->person_id)) {
            return $this->response->setJSON(['success' => false, 'message' => 'Suppression réservée à l\'administrateur.']);
        }

        $cash_ups_to_delete = $this->request->getPost('ids', FILTER_SANITIZE_SPECIAL_CHARS);

        if ($this->cashup->delete_list($cash_ups_to_delete)) {
            return $this->response->setJSON(['success' => true, 'message' => lang('Cashups.successful_deleted') . ' ' . count($cash_ups_to_delete) . ' ' . lang('Cashups.one_or_multiple'), 'ids' => $cash_ups_to_delete]);
        } else {
            return $this->response->setJSON(['success' => false, 'message' => lang('Cashups.cannot_be_deleted'), 'ids' => $cash_ups_to_delete]);
        }
    }

    /**
     * Calculate the total for cashups. Used in app\Views\cashups\form.php
     *
     * @return ResponseInterface
     * @noinspection PhpUnused
     */
    public function postAjax_cashup_total(): ResponseInterface
    {
        $open_amount_cash = parse_decimals($this->request->getPost('open_amount_cash'));
        $transfer_amount_cash = parse_decimals($this->request->getPost('transfer_amount_cash'));
        $closed_amount_cash = parse_decimals($this->request->getPost('closed_amount_cash'));
        $closed_amount_due = parse_decimals($this->request->getPost('closed_amount_due'));
        $closed_amount_card = parse_decimals($this->request->getPost('closed_amount_card'));
        $closed_amount_check = parse_decimals($this->request->getPost('closed_amount_check'));

        $total = $this->_calculate_total($open_amount_cash, $transfer_amount_cash, $closed_amount_due, $closed_amount_cash, $closed_amount_card, $closed_amount_check);    // TODO: hungarian notation

        return $this->response->setJSON(['total' => to_currency_no_money($total)]);
    }

    /**
     * Calculate total
     */
    private function _calculate_total(float $open_amount_cash, float $transfer_amount_cash, float $closed_amount_due, float $closed_amount_cash, float $closed_amount_card, $closed_amount_check): float    // TODO: need to get rid of hungarian notation here. Also, the signature is pretty long.  Perhaps they need to go into an object or array?
    {
        return ($closed_amount_cash - $open_amount_cash - $transfer_amount_cash + $closed_amount_due + $closed_amount_card + $closed_amount_check);
    }
}
