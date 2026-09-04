<?php

declare(strict_types=1);

final class CategoryRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    public function findAll(): array
    {
        $stmt = $this->pdo->query('
            SELECT id, name, description
            FROM categories
            ORDER BY id
        ');

        return $stmt->fetchAll();
    }
}
