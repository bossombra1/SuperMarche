<?php
/**
 * @var object $cash_ups_info
 * @var array $employees
 * @var string $controller_name
 * @var array $config
 */
?>

<div id="required_fields_message"><?= lang('Common.fields_required_message') ?></div>
<ul id="error_message_box" class="error_message_box"></ul>

<?php
$isNewCashup = empty($cash_ups_info->cashup_id) || $cash_ups_info->cashup_id == NEW_ENTRY;
$isClosedCashup = isset($cash_ups_info->status) && (int) $cash_ups_info->status === 1;
$isOpenCashup = !$isNewCashup && !$isClosedCashup;
$isAdmin = !empty($is_admin);
$canClose = !empty($can_close) && $isOpenCashup;
$closeMode = !empty($close_mode);
?>

<?= form_open('cashups/save/' . $cash_ups_info->cashup_id, ['id' => 'cashups_edit_form', 'class' => 'form-horizontal'])    // TODO: String Interpolation ?>
    <fieldset id="item_basic_info">

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.info'), 'cash_ups_info', ['class' => 'control-label col-xs-3']) ?>
            <?= form_label(!empty($cash_ups_info->cashup_id) ? lang('Cashups.id') . ' ' . $cash_ups_info->cashup_id : '', 'cashup_id', ['class' => 'control-label col-xs-8', 'style' => 'text-align: left']) ?>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label('État', 'cashup_status', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-6">
                <p class="form-control-static">
                    <?= $isNewCashup ? 'Nouvelle session' : ($isClosedCashup ? 'Session fermée' : 'Session ouverte') ?>
                </p>
            </div>
        </div>
        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.open_date'), 'open_date', ['class' => 'control-label col-xs-3 text-danger required']) ?>
            <div class="col-xs-6">
                <div class="input-group">
                    <span class="input-group-addon input-sm">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    <?= form_input([
                        'name'     => 'open_date',
                        'id'       => 'open_date',
                        'class'    => 'form-control input-sm datepicker',
                        'readonly' => ($isClosedCashup || !$isAdmin) ? 'readonly' : null,
                        'value'    => to_datetime(strtotime($cash_ups_info->open_date))
                    ]) ?>
                </div>
            </div>
        </div>



        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.open_employee'), 'open_employee', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-6">
                <?= form_dropdown('open_employee_id', $employees, $cash_ups_info->open_employee_id, 'id="open_employee_id" class="form-control"') ?>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.open_amount_cash'), 'open_amount_cash', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-4">
                <div class="input-group input-group-sm">
                    <?php if (!is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                    <?= form_input([
                        'name'  => 'open_amount_cash',
                        'id'    => 'open_amount_cash',
                        'class' => 'form-control input-sm',
                        'readonly' => !$isAdmin ? 'readonly' : null,
                        'value' => to_currency_no_money($cash_ups_info->open_amount_cash)
                    ]) ?>
                    <?php if (is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.transfer_amount_cash'), 'transfer_amount_cash', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-4">
                <div class="input-group input-group-sm">
                    <?php if (!is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                    <?= form_input([
                        'name'  => 'transfer_amount_cash',
                        'id'    => 'transfer_amount_cash',
                        'class' => 'form-control input-sm',
                        'value' => to_currency_no_money($cash_ups_info->transfer_amount_cash)
                    ]) ?>
                    <?php if (is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.close_date'), 'close_date', ['class' => 'control-label col-xs-3 text-danger required']) ?>
            <div class="col-xs-6">
                <div class="input-group">
                    <span class="input-group-addon input-sm">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    <?= form_input([
                        'name'  => 'close_date',
                        'id'    => 'close_date',
                        'class' => 'form-control input-sm datepicker',
                        'value' => to_datetime(strtotime($cash_ups_info->close_date))
                    ]) ?>
                </div>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.close_employee'), 'close_employee', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-6">
                <?= form_dropdown('close_employee_id', $employees, $cash_ups_info->close_employee_id, 'id="close_employee_id" class="form-control"') ?>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.closed_amount_cash'), 'closed_amount_cash', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-4">
                <div class="input-group input-group-sm">
                    <?php if (!is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                    <?= form_input([
                        'name'  => 'closed_amount_cash',
                        'id'    => 'closed_amount_cash',
                        'class' => 'form-control input-sm',
                        'value' => to_currency_no_money($cash_ups_info->closed_amount_cash)
                    ]) ?>
                    <?php if (is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.note'), 'note', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-6">
                <?= form_checkbox([
                    'name'    => 'note',
                    'id'      => 'note',
                    'value'   => 0,
                    'checked' => $cash_ups_info->note == 1
                ]) ?>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.closed_amount_due'), 'closed_amount_due', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-4">
                <div class="input-group input-group-sm">
                    <?php if (!is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                    <?= form_input([
                        'name'  => 'closed_amount_due',
                        'id'    => 'closed_amount_due',
                        'class' => 'form-control input-sm',
                        'value' => to_currency_no_money($cash_ups_info->closed_amount_due)
                    ]) ?>
                    <?php if (is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.closed_amount_card'), 'closed_amount_card', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-4">
                <div class="input-group input-group-sm">
                    <?php if (!is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                    <?= form_input([
                        'name'  => 'closed_amount_card',
                        'id'    => 'closed_amount_card',
                        'class' => 'form-control input-sm',
                        'value' => to_currency_no_money($cash_ups_info->closed_amount_card)
                    ]) ?>
                    <?php if (is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.closed_amount_check'), 'closed_amount_check', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-4">
                <div class="input-group input-group-sm">
                    <?php if (!is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                    <?= form_input([
                        'name'  => 'closed_amount_check',
                        'id'    => 'closed_amount_check',
                        'class' => 'form-control input-sm',
                        'value' => to_currency_no_money($cash_ups_info->closed_amount_check)
                    ]) ?>
                    <?php if (is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.closed_amount_total'), 'closed_amount_total', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-4">
                <div class="input-group input-group-sm">
                    <?php if (!is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                    <?= form_input([
                        'name'     => 'closed_amount_total',
                        'id'       => 'closed_amount_total',
                        'readonly' => 'true',
                        'class'    => 'form-control input-sm',
                        'value'    => to_currency_no_money($cash_ups_info->closed_amount_total)
                    ]) ?>
                    <?php if (is_right_side_currency_symbol()): ?>
                        <span class="input-group-addon input-sm"><b><?= esc($config['currency_symbol']) ?></b></span>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="form-group form-group-sm">
            <?= form_label(lang('Cashups.description'), 'description', ['class' => 'control-label col-xs-3']) ?>
            <div class="col-xs-6">
                <?= form_textarea([
                    'name'  => 'description',
                    'id'    => 'description',
                    'class' => 'form-control input-sm',
                    'value' => $cash_ups_info->description
                ]) ?>
            </div>
        </div>

        <?php if (!empty($cash_ups_info->cashup_id)) { ?>
            <div class="form-group form-group-sm">
                <?= form_label(lang('Cashups.is_deleted') . ':', 'deleted', ['class' => 'control-label col-xs-3']) ?>
                <div class="col-xs-5">
                    <?= form_checkbox([
                        'name'    => 'deleted',
                        'id'      => 'deleted',
                        'value'   => 1,
                        'checked' => $cash_ups_info->deleted == 1
                    ]) ?>
                </div>
            </div>
        <?php } ?>
        <?= form_hidden('close_session', ($closeMode || (!$isAdmin && $canClose)) ? '1' : '0') ?>
        <div class="form-group form-group-sm">
            <div class="col-xs-offset-3 col-xs-9">
                <?php if ($isNewCashup): ?>
                    <span class="text-muted">Ouvrir la caisse depuis Ventes</span>
                <?php elseif ($isOpenCashup): ?>
                    <?php if ($isAdmin && !$closeMode): ?>
                        <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
                        <a href="<?= site_url('cashups/view/' . $cash_ups_info->cashup_id . '?mode=close') ?>" class="btn btn-danger modal-dlg" data-btn-submit="Confirmer la fermeture" title="Fermer la caisse">Fermer la caisse</a>
                    <?php elseif ($canClose): ?>
                        <button type="submit" class="btn btn-danger">Confirmer la fermeture</button>
                    <?php endif; ?>
                <?php elseif ($isClosedCashup && $isAdmin): ?>
                    <button type="submit" class="btn btn-primary">Enregistrer les corrections administratives</button>
                <?php else: ?>
                    <span class="text-muted">Session fermée</span>
                <?php endif; ?>
            </div>
        </div>

    </fieldset>
<?= form_close() ?>

<script type="text/javascript">
    // Validation and submit handling
    $(document).ready(function() {
        <?= view('partial/datepicker_locale') ?>

        $('#open_date').datetimepicker({
            format: "<?= dateformat_bootstrap($config['dateformat']) . ' ' . dateformat_bootstrap($config['timeformat']) ?>",
            startDate: "<?= date($config['dateformat'] . ' ' . esc($config['timeformat'], 'js'), mktime(0, 0, 0, 1, 1, 2010)) ?>",
            <?php
            $t = $config['timeformat'];
            $m = $t[strlen($t) - 1];
            if (str_contains($config['timeformat'], 'a') || str_contains($config['timeformat'], 'A')) {
            ?>
                showMeridian: true,
            <?php } else { ?>
                showMeridian: false,
            <?php } ?>
            minuteStep: 1,
            autoclose: true,
            todayBtn: true,
            todayHighlight: true,
            bootcssVer: 3,
            language: '<?= current_language_code() ?>'
        });

        $('#close_date').datetimepicker({
            format: "<?= dateformat_bootstrap($config['dateformat']) . ' ' . dateformat_bootstrap($config['timeformat']) ?>",
            startDate: "<?= date($config['dateformat'] . ' ' . esc($config['timeformat'], 'js'), mktime(0, 0, 0, 1, 1, 2010)) ?>",
            <?php
            $t = $config['timeformat'];
            $m = $t[strlen($t) - 1];
            if (str_contains($config['timeformat'], 'a') || str_contains($config['timeformat'], 'A')) {
            ?>
                showMeridian: true,
            <?php } else { ?>
                showMeridian: false,
            <?php } ?>
            minuteStep: 1,
            autoclose: true,
            todayBtn: true,
            todayHighlight: true,
            bootcssVer: 3,
            language: '<?= current_language_code() ?>'
        });

        $('#open_amount_cash, #transfer_amount_cash, #closed_amount_cash, #closed_amount_due, #closed_amount_card, #closed_amount_check').keyup(function() {
            $.post("<?= esc("$controller_name/ajax_cashup_total") ?>", {
                    'open_amount_cash': $('#open_amount_cash').val(),
                    'transfer_amount_cash': $('#transfer_amount_cash').val(),
                    'closed_amount_due': $('#closed_amount_due').val(),
                    'closed_amount_cash': $('#closed_amount_cash').val(),
                    'closed_amount_card': $('#closed_amount_card').val(),
                    'closed_amount_check': $('#closed_amount_check').val()
                },
                function(response) {
                    $('#closed_amount_total').val(response.total);
                },
                'json'
            );
        });

        const submit_form = function() {
            $(this).ajaxSubmit({
                success: function(response) {
                    dialog_support.hide();
                    table_support.handle_submit('<?= esc('cashups') ?>', response);
                },
                dataType: 'json'
            });
        };

        $('#cashups_edit_form').validate($.extend({
            submitHandler: function(form) {
                submit_form.call(form);
            },
            rules: {

            },
            messages: {
                open_date: {
                    required: '<?= lang('Cashups.date_required') ?>'

                },
                close_date: {
                    required: '<?= lang('Cashups.date_required') ?>'

                },
                amount: {
                    required: '<?= lang('Cashups.amount_required') ?>',
                    number: '<?= lang('Cashups.amount_number') ?>'
                }
            }
        }, form_support.error));
    });
</script>
