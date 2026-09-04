<?php

declare(strict_types=1);

final class CategoryController
{
    public function __construct(private CategoryRepository $categories)
    {
    }

    public function list(): void
    {
        JsonResponse::send($this->categories->findAll());
    }
}
