<?php
$envFile = file(__DIR__ . '/.env', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
$config = [];

foreach ($envFile as $line) {
    $line = trim($line);

    if ($line === '' || str_starts_with($line, '#')) {
        continue;
    }

    if (preg_match('/^(MYSQL_HOST_NAME|MYSQL_USERNAME|MYSQL_PASSWORD|MYSQL_DB_NAME)\s*=\s*(.*)$/', $line, $matches)) {
        $value = trim($matches[2]);

        if (strlen($value) >= 2 &&
            (($value[0] === '"' && substr($value, -1) === '"') ||
             ($value[0] === "'" && substr($value, -1) === "'"))) {
            $value = substr($value, 1, -1);
        }

        $config[$matches[1]] = $value;
    }
}

$host = $config['MYSQL_HOST_NAME'] ?? '127.0.0.1';
$user = $config['MYSQL_USERNAME'] ?? '';
$password = $config['MYSQL_PASSWORD'] ?? '';
$database = $config['MYSQL_DB_NAME'] ?? '';

if ($user === '' || $database === '') {
    die("Erreur : variables MYSQL_USERNAME ou MYSQL_DB_NAME absentes du fichier .env." . PHP_EOL);
}

$db = new mysqli($host, $user, $password, $database, 3306);

if ($db->connect_error) {
    die("Erreur MySQL : " . $db->connect_error . PHP_EOL);
}

echo "Connexion MySQL reussie." . PHP_EOL;
echo "Base selectionnee : " . $db->query('SELECT DATABASE()')->fetch_row()[0] . PHP_EOL;

$result = $db->query('SHOW TABLES');
echo "Nombre de tables : " . $result->num_rows . PHP_EOL;

while ($row = $result->fetch_row()) {
    echo "- " . $row[0] . PHP_EOL;
}

$db->close();
