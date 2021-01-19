FROM mediawiki:stable

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && apt-get update && apt-get install -y vim libcap2-bin rsync nano && \
    install-php-extensions gd intl ldap oauth zip imagick && \
    apt-get autoremove -y && a2enmod rewrite && setcap 'cap_net_bind_service=+ep' $(which apache2) && \
    chgrp 0 -R /var/www/html && chmod g+rwx -R /var/www/html && chgrp 0 -R /var/log && chmod g+rwx -R /var/log

USER 1450:0