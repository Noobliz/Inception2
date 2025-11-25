#!/bin/sh


echo "Hello, I am Lise. I certify that this image is custom.\n"


cd /var/www/html


# Vérifier si WordPress est déjà installé
if [ ! -f wp-config.php ]; then
    echo "Installing WordPress..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar


    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --dbname=wordpress --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root
    ./wp-cli.phar core install --url=lguiet.42.fr --title=inception --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=admin@admin.com --allow-root


    # Création de l'utilisateur lisux avec le même mot de passe que l'admin mais sans droits administrateur
    ./wp-cli.phar user create lisux lisux@lol.com --user_pass=$WP_PASS --role=author --allow-root
else
    echo "WordPress is already installed, skipping installation."
fi


exec "$@"