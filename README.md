## Стек

- PHP 8.5.9
- PostgreSQL 18
- Docker Compose

## Запуск

1. Скопируйте `.env.example` в `.env` и при необходимости поменяйте значения:

```
cp .env.example .env
```
2. Запустите контейнеры:

```
docker compose up --build
```
3. При первом запуске PostgreSQL автоматически создаст таблицы и заполнит их данными из `DataBases.sql`.

## API

### GET /index.php?category_id={id}

Возвращает список товаров указанной категории.
