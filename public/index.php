<?php

require_once __DIR__ . '/../config/config.php';  

header('Content-Type: application/json');

try {
    if (!isset($_GET['category_id']) || $_GET['category_id'] === '') {
        http_response_code(400);
        echo json_encode(['error' => 'Missing category_id parameter']);
        exit;
    }

    $categoryId = $_GET['category_id'];

    if (!ctype_digit($categoryId)) {
        http_response_code(400);
        echo json_encode(['error' => 'category_id must be an integer']);
        exit;
    }

    $categoryId = (int) $categoryId;

    $config = getDbConfig();
    $dsn = sprintf(
        'pgsql:host=%s;port=%s;dbname=%s;',
        $config['host'],
        $config['port'],
        $config['dbname']
    );

    $pdo = new PDO($dsn, $config['user'], $config['password']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

    $stmt = $pdo->prepare('
        SELECT id, name, price, description, category_id, created_at
        FROM products
        WHERE category_id = :category_id
        ORDER BY name
    ');
    $stmt->execute([':category_id' => $categoryId]);
    $products = $stmt->fetchAll();

    echo json_encode($products, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Server error: ' . $e->getMessage()]);
}