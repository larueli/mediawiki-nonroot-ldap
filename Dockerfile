FROM mediawiki:stable

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && apt-get update && apt-get install -y vim libcap2-bin rsync nano && \
    install-php-extensions gd intl ldap oauth zip imagick && \
    apt-get autoremove -y && a2enmod rewrite && setcap 'cap_net_bind_service=+ep' $(which apache2) && \
    curl -O https://extdist.wmflabs.org/dist/extensions/PluggableAuth-REL1_34-17fb1ea.tar.gz && tar -xzf PluggableAuth-REL1_34-17fb1ea.tar.gz -C /var/www/html/extensions && \
    curl -O https://extdist.wmflabs.org/dist/extensions/LDAPProvider-master-8ead6a3.tar.gz && tar -xzf LDAPProvider-master-8ead6a3.tar.gz -C /var/www/html/extensions && \ 
    curl -O https://extdist.wmflabs.org/dist/extensions/LDAPAuthentication2-master-02f9330.tar.gz && tar -xzf LDAPAuthentication2-master-02f9330.tar.gz -C /var/www/html/extensions && \
    chgrp 0 -R /var/www/html && chmod g+rwx -R /var/www/html

USER 1450:0