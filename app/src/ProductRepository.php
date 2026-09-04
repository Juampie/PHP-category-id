<?php

declare(strict_types=1);

final class ProductRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    public function findByCategoryId(int $categoryId): array
    {
        $stmt = $this->pdo->prepare('
            SELECT id, name, price, description, category_id, created_at
            FROM products
            WHERE category_id = :category_id
            ORDER BY name
        ');
        $stmt->execute([':category_id' => $categoryId]);

        return $stmt->fetchAll();
    }
}
