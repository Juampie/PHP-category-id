<?php

declare(strict_types=1);

function loadEnv(string $path): void
{
    if (!is_file($path)) {
        return;
    }

    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    if ($lines === false) {
        return;
    }

    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) {
            continue;
        }

        if (!str_contains($line, '=')) {
            continue;
        }

        [$key, $value] = explode('=', $line, 2);
        $key = trim($key);
        if (getenv($key) === false) {
            putenv($key . '=' . trim($value));
        }
    }
}

loadEnv(__DIR__ . '/../.env');
loadEnv(__DIR__ . '/../../.env');

spl_autoload_register(static function (string $class): void {
    $file = dirname(__DIR__) . '/src/' . $class . '.php';
    if (is_file($file)) {
        require_once $file;
    }
});
