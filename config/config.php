<?php

function loadEnv($path)
{
    if (!file_exists($path)) {
        return;
    }
    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) continue;
        list($key, $value) = explode('=', $line, 2);
        $key = trim($key);
        if (getenv($key) === false) {
            putenv($key . '=' . trim($value));
        }
    }
}

loadEnv(__DIR__ . '/../.env');


function getDbConfig(): array
{
    return [
        'host'     => getenv('DB_HOST') ?: 'localhost',
        'port'     => getenv('DB_PORT') ?: '5432',
        'dbname'   => getenv('DB_NAME') ?: 'PHP_databases',
        'user'     => getenv('DB_USER') ?: 'postgres',
        'password' => getenv('DB_PASS') ?: '',
    ];
}
