<?php

declare(strict_types=1);

require_once __DIR__ . '/../config/bootstrap.php';

try {
    $config = require __DIR__ . '/../config/config.php';
    $controller = new CategoryController(
        new CategoryRepository(Database::connect($config))
    );
    $controller->list();
} catch (PDOException $e) {
    error_log($e->getMessage());
    JsonResponse::error('Database error', 500);
} catch (Throwable $e) {
    error_log($e->getMessage());
    JsonResponse::error('Server error', 500);
}
