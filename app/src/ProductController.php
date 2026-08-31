<?php

declare(strict_types=1);

final class ProductController
{
    public function __construct(private ProductRepository $products)
    {
    }

    public function listByCategory(?string $categoryId): void
    {
        if ($categoryId === null || $categoryId === '') {
            JsonResponse::error('Missing category_id parameter', 400);
            return;
        }

        if (!ctype_digit($categoryId)) {
            JsonResponse::error('category_id must be an integer', 400);
            return;
        }

        JsonResponse::send(
            $this->products->findByCategoryId((int) $categoryId)
        );
    }
}
