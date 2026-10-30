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
        $is_admin = $this->employee->isAdmin($logged_in_employee->person_id);

        foreach ($cash_ups->getResult() as $cash_up) {
            $can_close = isset($cash_up->status) && (int) $cash_up->status === 0
                && ($is_admin || (int) $cash_up->open_employee_id === (int) $logged_in_employee->person_id);
            $data_rows[] = get_cash_up_data_row($cash_up, $is_admin, $can_close);
        }

        return $this->response->setJSON(['total' => $total_rows, 'rows' => $data_rows]);
    }

    /**
     * @param int $cashup_id
     * @return string
     */
    public function getView(int $cashup_id = NEW_ENTRY): string
    {
        $loggedIn = $this->employee->get_logged_in_employee_info();
        $employeeId = (int) $loggedIn->person_id;
        $isAdmin = $this->employee->isAdmin($employeeId);

        $cashup = $this->cashup->get_info($cashup_id);
        $isNew = ($cashup_id === NEW_ENTRY || (int) ($cashup->cashup_id ?? NEW_ENTRY) === NEW_ENTRY);
        $isOpen = !$isNew && isset($cashup->status) && (int) $cashup->status === 0;

        if (!$isNew && !$isAdmin) {
            if ((int) $cashup->open_employee_id !== $employeeId) {
                return '<div class="alert alert-danger">Accès refusé à cette session de caisse.</div>';
            }
            if (!$isOpen) {
                return '<div class="alert alert-danger">Seul un administrateur peut consulter ou corriger une session fermée.</div>';
            }
        }

        $employees = [];
        foreach ($this->employee->get_all()->getResult() as $employee) {
            $employees[$employee->person_id] = $employee->first_name . ' ' . $employee->last_name;
        }

        if ($isOpen) {
            // Préremplir les montants attendus à partir des paiements réellement liés à cette session.
            $totals = $this->cashup->get_linked_payment_totals($cashup_id);
            $cashup->closed_amount_cash = (float) $cashup->open_amount_cash
                + (float) $cashup->transfer_amount_cash + $totals['cash'];
            $cashup->closed_amount_due = $totals['due'];
            $cashup->closed_amount_card = $totals['card'];
            $cashup->closed_amount_check = $totals['check'];
            $cashup->closed_amount_total = $this->_calculate_total(
                (float) $cashup->open_amount_cash,
                (float) $cashup->transfer_amount_cash,
                (float) $cashup->closed_amount_due,
                (float) $cashup->closed_amount_cash,
                (float) $cashup->closed_amount_card,
                (float) $cashup->closed_amount_check
            );
            // Une session ouverte ne doit jamais afficher des informations de clôture prématurées.
            $cashup->close_date = null;
            $cashup->close_employee_id = null;
        }

        return view('cashups/form', [
            'cash_ups_info' => $cashup,
            'employees' => $employees,
            'is_admin' => $isAdmin,
            'can_close' => $isOpen && ($isAdmin || (int) $cashup->open_employee_id === $employeeId),
            'close_mode' => $this->request->getGet('mode') === 'close',
            'config' => $this->config
        ]);
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

        $loggedIn = $this->employee->get_logged_in_employee_info();
        $employeeId = (int) $loggedIn->person_id;
        $isAdmin = $this->employee->isAdmin($employeeId);
        $existing = $this->cashup->get_info($cashup_id);

        if (empty($existing->cashup_id) || (int) $existing->cashup_id !== $cashup_id) {
            return $this->response->setJSON(['success' => false, 'message' => 'Session de caisse introuvable.', 'id' => $cashup_id]);
        }

        $isOpen = isset($existing->status) && (int) $existing->status === 0;
        $closeRequested = $this->request->getPost('close_session') === '1';

        if (!$isAdmin) {
            if (!$isOpen || (int) $existing->open_employee_id !== $employeeId || !$closeRequested) {
                return $this->response->setJSON(['success' => false, 'message' => 'Vous pouvez uniquement fermer votre propre session ouverte.', 'id' => $cashup_id]);
            }
        } elseif (!$isOpen && !$isAdmin) {
            return $this->response->setJSON(['success' => false, 'message' => 'Session fermée.', 'id' => $cashup_id]);
        }

        // Les valeurs d'ouverture sont immuables pour un caissier et restent issues de la base.
        $openDate = $isAdmin && $this->request->getPost('open_date')
            ? $this->request->getPost('open_date') : $existing->open_date;
        $openEmployeeId = $isAdmin && $this->request->getPost('open_employee_id')
            ? (int) $this->request->getPost('open_employee_id') : (int) $existing->open_employee_id;
        $openAmountCash = $isAdmin && $this->request->getPost('open_amount_cash') !== null
            ? parse_decimals($this->request->getPost('open_amount_cash')) : (float) $existing->open_amount_cash;

        $transferAmountCash = $isAdmin
            ? parse_decimals($this->request->getPost('transfer_amount_cash'))
            : (float) $existing->transfer_amount_cash;

        $closedAmountCash = parse_decimals($this->request->getPost('closed_amount_cash'));
        $closedAmountDue = parse_decimals($this->request->getPost('closed_amount_due'));
        $closedAmountCard = parse_decimals($this->request->getPost('closed_amount_card'));
        $closedAmountCheck = parse_decimals($this->request->getPost('closed_amount_check'));

        $closing = $isOpen && $closeRequested;
        $cashupData = [
            'open_date' => $openDate,
            'open_employee_id' => $openEmployeeId,
            'open_amount_cash' => $openAmountCash,
            'transfer_amount_cash' => $transferAmountCash,
            'closed_amount_cash' => $closedAmountCash,
            'closed_amount_due' => $closedAmountDue,
            'closed_amount_card' => $closedAmountCard,
            'closed_amount_check' => $closedAmountCheck,
            'closed_amount_total' => $this->_calculate_total($openAmountCash, $transferAmountCash, $closedAmountDue, $closedAmountCash, $closedAmountCard, $closedAmountCheck),
            'note' => $this->request->getPost('note') !== null,
            'description' => $this->request->getPost('description', FILTER_SANITIZE_SPECIAL_CHARS),
            'deleted' => $isAdmin && $this->request->getPost('deleted') !== null ? 1 : (int) $existing->deleted,
            'status' => $closing ? 1 : (int) $existing->status,
            'close_date' => $closing ? date('Y-m-d H:i:s') : $existing->close_date,
            'close_employee_id' => $closing ? $employeeId : $existing->close_employee_id
        ];

        if (!$isAdmin && !$closing) {
            return $this->response->setJSON(['success' => false, 'message' => 'Action non autorisée.', 'id' => $cashup_id]);
        }

        if ($this->cashup->save_value($cashupData, $cashup_id)) {
            return $this->response->setJSON([
                'success' => true,
                'message' => $closing ? 'Caisse clôturée avec succès.' : lang('Cashups.successful_updating'),
                'id' => $cashup_id
            ]);
        }

        return $this->response->setJSON(['success' => false, 'message' => lang('Cashups.error_adding_updating'), 'id' => $cashup_id]);
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
