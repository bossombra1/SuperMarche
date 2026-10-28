<?php
$lines = file(__DIR__ . '/.env', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
$c = [];

foreach ($lines as $line) {
    if (preg_match('/^(MYSQL_HOST_NAME|MYSQL_USERNAME|MYSQL_PASSWORD|MYSQL_DB_NAME)\s*=\s*(.*)$/', trim($line), $m)) {
        $c[$m[1]] = trim(trim($m[2]), "\"'");
    }
}

$db = new mysqli(
    $c['MYSQL_HOST_NAME'] ?? '127.0.0.1',
    $c['MYSQL_USERNAME'] ?? '',
    $c['MYSQL_PASSWORD'] ?? '',
    $c['MYSQL_DB_NAME'] ?? '',
    3306
);

if ($db->connect_error) {
    die("Erreur MySQL : " . $db->connect_error . PHP_EOL);
}

echo "=== Structure de ospos_migrations ===" . PHP_EOL;
$result = $db->query("SHOW COLUMNS FROM ospos_migrations");

while ($row = $result->fetch_assoc()) {
    echo $row['Field'] . " (" . $row['Type'] . ")" . PHP_EOL;
}

echo PHP_EOL . "=== Enregistrements ===" . PHP_EOL;
$result = $db->query("SELECT * FROM ospos_migrations");
echo "Nombre d'enregistrements : " . $result->num_rows . PHP_EOL;

while ($row = $result->fetch_assoc()) {
    echo json_encode($row, JSON_UNESCAPED_UNICODE) . PHP_EOL;
}

$db->close();
