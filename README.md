## Стек

- PHP 8.5
- PostgreSQL 18
- nginx (фронт)
- Docker Compose

## Структура

- `app/` — PHP API (Dockerfile, код, конфиг)
- `db/` — схема и начальные данные Postgres
- `ui/` — минималистичный фронт
- `docker-compose.yml` — сборка и связь сервисов

## Запуск

1. Скопируйте `.env.example` в `.env` и при необходимости поменяйте значения:

```
cp .env.example .env
```

2. Запустите контейнеры:

```
docker compose up --build
```

3. При первом запуске PostgreSQL применит `db/schema.sql` и `db/seed.sql`.

Каталог: [http://localhost:8081](http://localhost:8081)

API напрямую: [http://localhost:8080](http://localhost:8080)

## API

### GET /categories.php

Список категорий.

### GET /index.php?category_id={id}

Список товаров указанной категории.

Через фронт те же данные доступны как `/api/categories` и `/api/products?category_id={id}`.
