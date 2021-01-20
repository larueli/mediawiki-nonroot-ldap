FROM larueli/php-base-image:7.4

ARG MEDIAWIKI_URL=https://releases.wikimedia.org/mediawiki/1.35/mediawiki-1.35.1.tar.gz

USER 0

RUN wget ${MEDIAWIKI_URL} -O mediawiki.tar.gz && tar zxvf mediawiki.tar.gz --strip-components=1 -C /var/www/html && \
    rm mediawiki.tar.gz && chgrp 0 -R /var/www/html && chmod g+rwx -R /var/www/html

USER 1450:0