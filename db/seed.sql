INSERT INTO public.categories VALUES (1, 'Электроника', 'Смартфоны, ноутбуки, аксессуары', '2026-07-31 16:26:20.658488+03');
INSERT INTO public.categories VALUES (2, 'Книги', 'Художественная и техническая литература', '2026-07-31 16:26:20.658488+03');
INSERT INTO public.categories VALUES (3, 'Одежда', 'Мужская, женская, детская одежда', '2026-07-31 16:26:20.658488+03');

INSERT INTO public.products VALUES (1, 'Смартфон X', 599.99, '6.5" экран, 128GB, камера 48MP', 1, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (2, 'Ноутбук Pro', 1299.00, '16GB RAM, 512GB SSD, Intel i7', 1, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (3, 'Беспроводные наушники', 89.90, 'шумоподавление, 20ч работы', 1, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (4, 'Война и мир', 15.50, 'роман Л.Н. Толстого', 2, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (5, 'Книга по PHP', 45.00, 'современный PHP 8', 2, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (6, 'Футболка хлопок', 19.99, 'размер M, белый', 3, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (7, 'Джинсы классические', 49.95, 'синие, размер 32/32', 3, '2026-07-31 16:26:20.658488+03');
INSERT INTO public.products VALUES (8, 'Смартфон X', 599.99, '6.5" экран, 128GB, камера 48MP', 1, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (9, 'Ноутбук Pro', 1299.00, '16GB RAM, 512GB SSD, Intel i7', 1, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (10, 'Беспроводные наушники', 89.90, 'шумоподавление, 20ч работы', 1, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (11, 'Война и мир', 15.50, 'роман Л.Н. Толстого', 2, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (12, 'Книга по PHP', 45.00, 'современный PHP 8', 2, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (13, 'Футболка хлопок', 19.99, 'размер M, белый', 3, '2026-07-31 16:26:28.579867+03');
INSERT INTO public.products VALUES (14, 'Джинсы классические', 49.95, 'синие, размер 32/32', 3, '2026-07-31 16:26:28.579867+03');

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);
SELECT pg_catalog.setval('public.products_id_seq', 14, true);
