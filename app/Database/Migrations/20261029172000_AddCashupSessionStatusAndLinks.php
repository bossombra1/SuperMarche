<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddCashupSessionStatusAndLinks extends Migration
{
    public function up(): void
    {
        $this->forge->addColumn('cash_up', [
            'status' => [
                'type'       => 'TINYINT',
                'constraint' => 1,
                'null'       => true,
                'default'    => null,
                'after'      => 'close_employee_id',
            ],
        ]);

        // Allow an open session to have no closing employee yet.
        $this->forge->modifyColumn('cash_up', [
            'close_employee_id' => [
                'type'       => 'INT',
                'constraint' => 11,
                'null'       => true,
                'default'    => null,
            ],
        ]);

        $this->forge->addColumn('sales', [
            'cashup_id' => [
                'type'       => 'INT',
                'constraint' => 11,
                'null'       => true,
                'default'    => null,
                'after'      => 'sale_id',
            ],
        ]);

        $this->forge->addColumn('sales_payments', [
            'cashup_id' => [
                'type'       => 'INT',
                'constraint' => 11,
                'null'       => true,
                'default'    => null,
                'after'      => 'payment_id',
            ],
        ]);

        $this->db->query('CREATE INDEX idx_cash_up_status_employee ON ' . $this->db->prefixTable('cash_up') . ' (open_employee_id, status)');
        $this->db->query('CREATE INDEX idx_sales_cashup ON ' . $this->db->prefixTable('sales') . ' (cashup_id)');
        $this->db->query('CREATE INDEX idx_sales_payments_cashup ON ' . $this->db->prefixTable('sales_payments') . ' (cashup_id)');
    }

    public function down(): void
    {
        $this->forge->dropColumn('cash_up', 'status');
        $this->forge->dropColumn('sales', 'cashup_id');
        $this->forge->dropColumn('sales_payments', 'cashup_id');
    }
}
