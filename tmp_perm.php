<?php
mysqli_report(MYSQLI_REPORT_OFF);
$m = new mysqli('127.0.0.1', 'supermarche_user', 'SuperMarche_Local_2026!', 'supermarche');
if ($m->connect_error) { echo "CONN: ".$m->connect_error."\n"; exit; }
echo "Permissions for cashups:\n";
$r = $m->query("SELECT * FROM ospos_permissions WHERE permission_id LIKE 'cashups%'");
while ($row=$r->fetch_assoc()) echo implode(" | ",$row)."\n";
echo "\nGrants for cashups:\n";
$r = $m->query("SELECT * FROM ospos_grants WHERE permission_id LIKE 'cashups%'");
while ($row=$r->fetch_assoc()) echo implode(" | ",$row)."\n";
echo "\nEmployees (person_id, username, deleted):\n";
$r = $m->query("SELECT person_id, username, deleted FROM ospos_employees");
while ($row=$r->fetch_assoc()) echo implode(" | ",$row)."\n";
$m->close();
