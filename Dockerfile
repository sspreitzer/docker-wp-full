FROM ubuntu:14.04.1

RUN apt-get update && \
  apt-get install -y curl unzip mysql-server apache2 libapache2-mod-php5 php5-mysql php5-gd

ENV WP_VERSION 4.1
ENV WP_MIG_VERSION 2.0.4

RUN curl -L https://www.wordpress.org/wordpress-${WP_VERSION}.tar.gz | tar xzf - -C /srv/
RUN curl -o /tmp/wp-mig.zip -L https://downloads.wordpress.org/plugin/all-in-one-wp-migration.${WP_MIG_VERSION}.zip && \
  unzip /tmp/wp-mig.zip -d /srv/wordpress/wp-content/plugins/

ADD entrypoint.sh /usr/local/sbin/
ADD wordpress.conf /etc/apache2/sites-available/
ADD wp-config.php /srv/wordpress/

RUN a2dissite 000-default
RUN a2ensite wordpress
RUN a2enmod rewrite

ENTRYPOINT ["entrypoint.sh"]

CMD ["wordpress"]

EXPOSE 80

VOLUME /srv/wordpress
VOLUME /var/lib/mysql

