<?php
/**
 * @var string $controller_name
 * @var string $table_headers
 * @var array $filters
 * @var array $stock_locations
 * @var int $stock_location
 * @var array $config
 * @var string|null $start_date
 * @var string|null $end_date
 * @var array $selected_filters
 */

use App\Models\Employee;
?>

<?= view('partial/header') ?>

<style>
/* Mise en page propre à la liste des articles. */
#table_holder,
#table_holder .bootstrap-table,
#table_holder .fixed-table-container,
#table_holder .fixed-table-body {
    width: 100%;
    max-width: 100%;
}
#table_holder .fixed-table-container,
#table_holder .fixed-table-body {
    overflow-x: auto;
}
#table_holder table {
    width: 100% !important;
    min-width: 1450px;
    table-layout: auto;
}
#table_holder th,
#table_holder td {
    padding: 7px 6px;
    white-space: normal;
    overflow-wrap: break-word;
    vertical-align: middle;
    font-size: 12px;
}
/* Colonnes principales : largeurs adaptées au contenu. */
#table_holder th[data-field="state"],
#table_holder td.bs-checkbox { width: 32px !important; min-width: 32px; }
#table_holder th[data-field="items.item_id"] { width: 55px !important; min-width: 55px; }
#table_holder th[data-field="item_number"] { width: 95px !important; min-width: 95px; }
#table_holder th[data-field="name"] { width: 190px !important; min-width: 150px; }
#table_holder th[data-field="category"] { width: 120px !important; min-width: 100px; }
#table_holder th[data-field="company_name"] { width: 145px !important; min-width: 120px; }
#table_holder th[data-field="cost_price"],
#table_holder th[data-field="unit_price"] { width: 105px !important; min-width: 95px; }
#table_holder th[data-field="quantity"] { width: 75px !important; min-width: 65px; }
#table_holder th[data-field="tax_percents"] { width: 105px !important; min-width: 95px; }
#table_holder th[data-field="item_pic"] { width: 65px !important; min-width: 60px; }
/* Attributs personnalisés (Marque, Date, Poids, Produit local, Conditionnement...). */
#table_holder th[data-field]:not([data-field="state"]):not([data-field="items.item_id"]):not([data-field="item_number"]):not([data-field="name"]):not([data-field="category"]):not([data-field="company_name"]):not([data-field="cost_price"]):not([data-field="unit_price"]):not([data-field="quantity"]):not([data-field="tax_percents"]):not([data-field="item_pic"]):not([data-field="inventory"]):not([data-field="stock"]):not([data-field="edit"]) {
    min-width: 95px;
    width: 95px;
}
/* Actions compactes, sans sacrifier les colonnes d'informations. */
#table_holder th[data-field="inventory"],
#table_holder th[data-field="stock"],
#table_holder th[data-field="edit"] { width: 38px !important; min-width: 38px; }
#table_holder td[data-field="inventory"],
#table_holder td[data-field="stock"],
#table_holder td[data-field="edit"] {
    width: 38px;
    min-width: 38px;
    padding-left: 2px;
    padding-right: 2px;
    text-align: center;
}
#table_holder td[data-field="inventory"] a,
#table_holder td[data-field="stock"] a,
#table_holder td[data-field="edit"] a { display: inline-block; padding: 2px; }
@media (max-width: 767px) {
    #table_holder table { min-width: 1450px; }
}
</style>

<script type="text/javascript">
    $(document).ready(function() {
        $('#generate_barcodes').click(function() {
            window.open(
                'index.php/items/generateBarcodes/' + table_support.selected_ids().join(':'),
                '_blank'
            );
        });

        $('#filters').on('hidden.bs.select', function(e) {
            table_support.refresh();
        });

        if ($('#stock_location').length) {
            $('#stock_location').on('change', function() {
                table_support.refresh();
            });
        }

        // Load the preset daterange picker
        <?= view('partial/daterangepicker') ?>

        $("#daterangepicker").on('apply.daterangepicker', function(ev, picker) {
            table_support.refresh();
        });

        // Set the beginning of time as starting date
        $('#daterangepicker').data('daterangepicker').setStartDate("<?= date($config['dateformat'], mktime(0, 0, 0, 01, 01, 2010)) ?>");
        // Update the hidden inputs with the selected dates before submitting the search data
        start_date = "<?= date('Y-m-d', mktime(0, 0, 0, 01, 01, 2010)) ?>";

        // Override dates from server if provided
        <?php if (isset($start_date) && $start_date): ?>
        start_date = "<?= esc($start_date) ?>";
        <?php endif; ?>
        <?php if (isset($end_date) && $end_date): ?>
        end_date = "<?= esc($end_date) ?>";
        <?php endif; ?>

        <?php
        echo view('partial/bootstrap_tables_locale');
        $employee = model(Employee::class);
        ?>

        table_support.init({
            employee_id: <?= $employee->get_logged_in_employee_info()->person_id ?>,
            resource: '<?= esc($controller_name) ?>',
            headers: <?= $table_headers ?>,
            pageSize: <?= $config['lines_per_page'] ?>,
            uniqueId: 'items.item_id',
            queryParams: function() {
                return $.extend(arguments[0], {
                    "start_date": start_date,
                    "end_date": end_date,
                    "stock_location": $("#stock_location").val(),
                    "filters": $("#filters").val()
                });
            },
            onLoadSuccess: function(response) {
                $('a.rollover').imgPreview({
                    imgCSS: {
                        width: 200
                    },
                    distanceFromCursor: {
                        top: 10,
                        left: -210
                    }
                })
            }
        });
    });
</script>

<?= view('partial/table_filter_persistence', ['additional_params' => ['stock_location']]) ?>

<div id="title_bar" class="btn-toolbar print_hide">
    <button class="btn btn-info btn-sm pull-right modal-dlg" data-btn-submit="<?= lang('Common.submit') ?>" data-href="<?= "$controller_name/csvImport" ?>" title="<?= lang('Items.import_items_csv') ?>">
        <span class="glyphicon glyphicon-import">&nbsp;</span><?= lang('Common.import_csv') ?>
    </button>

    <button class="btn btn-info btn-sm pull-right modal-dlg" data-btn-new="<?= lang('Common.new') ?>" data-btn-submit="<?= lang('Common.submit') ?>" data-href="<?= "$controller_name/view" ?>" title="<?= lang(ucfirst($controller_name) . '.new') ?>">
        <span class="glyphicon glyphicon-tag">&nbsp;</span><?= lang(ucfirst($controller_name) . '.new') ?>
    </button>
</div>

<div id="toolbar">
    <div class="pull-left form-inline" role="toolbar">
        <button id="delete" class="btn btn-default btn-sm print_hide">
            <span class="glyphicon glyphicon-trash">&nbsp;</span><?= lang('Common.delete') ?>
        </button>
        <button id="bulk_edit" class="btn btn-default btn-sm modal-dlg print_hide" data-btn-submit="<?= lang('Common.submit') ?>" data-href="<?= "items/bulkEdit" ?>" title="<?= lang('Items.edit_multiple_items') ?>">
            <span class="glyphicon glyphicon-edit">&nbsp;</span><?= lang('Items.bulk_edit') ?>
        </button>
        <button id="generate_barcodes" class="btn btn-default btn-sm print_hide" data-href="<?= "$controller_name/generateBarcodes" ?>" title="<?= lang('Items.generate_barcodes') ?>">
            <span class="glyphicon glyphicon-barcode">&nbsp;</span><?= lang('Items.generate_barcodes') ?>
        </button>
        <?= form_input(['name' => 'daterangepicker', 'class' => 'form-control input-sm', 'id' => 'daterangepicker']) ?>
        <?= form_multiselect('filters[]', $filters, $selected_filters ?? [], [
            'id'                        => 'filters',
            'class'                     => 'selectpicker show-menu-arrow',
            'data-none-selected-text'   => lang('Common.none_selected_text'),
            'data-selected-text-format' => 'count > 1',
            'data-style'                => 'btn-default btn-sm',
            'data-width'                => 'fit'
        ]) ?>
        <?php
        if (count($stock_locations) > 1) {
            echo form_dropdown(
                'stock_location',
                $stock_locations,
                $stock_location,
                [
                    'id'         => 'stock_location',
                    'class'      => 'selectpicker show-menu-arrow',
                    'data-style' => 'btn-default btn-sm',
                    'data-width' => 'fit'
                ]
            );
        }
        ?>
    </div>
</div>

<div id="table_holder">
    <table id="table"></table>
</div>

<?= view('partial/footer') ?>
