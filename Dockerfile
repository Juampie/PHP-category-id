FROM php:8.5-apache

# Устанавливаем системные зависимости и расширение pdo_pgsql
RUN apt-get update && apt-get install -y \
        libpq-dev \
    && docker-php-ext-install pdo_pgsql \
    && a2enmod rewrite

# Копируем весь проект в контейнер
COPY . /var/www/html/

# Меняем владельца для безопасности
RUN chown -R www-data:www-data /var/www/html

# Настраиваем DocumentRoot на папку public (где лежит index.php)
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Открываем порт 80
EXPOSE 80
