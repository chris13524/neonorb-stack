From ubuntu:xenial
MAINTAINER Neon Orb <neonorb@neonorb.com>

EXPOSE 587 993

# Install apps and make postfix follow default configs.
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get install -qy dovecot-common dovecot-imapd postfix spamassassin spamc sed

# Dovecot
ADD dovecot/dovecot.conf     /etc/dovecot/
ADD dovecot/dovecot-sql.conf /etc/dovecot/
ADD dovecot/10-mail.conf     /etc/dovecot/conf.d/
ADD dovecot/10-ssl.conf      /etc/dovecot/conf.d/

# Postfix
ADD postfix/main.cf          /etc/postfix/
ADD postfix/master.cf        /etc/postfix/
ADD postfix/mysql-aliases.cf /etc/postfix/
ADD postfix/mysql-boxes.cf   /etc/postfix/
ADD postfix/dynamicmaps.cf   /etc/postfix/

# PostfixES - lol
RUN sed -i.bak s/\$DOMAIN_NAME/neonorb.com/ /etc/postfix/main.cf && \
    hostname --fqdn > /etc/mailname && \
    postconf compatibility_level=2 && \
    echo " " |> /var/log/mail.log

# Spamassassin
ADD spamassassin/spamassassin /etc/default/

CMD postfix start && \
    sleep 1 && \
    tail -f /var/log/mail.log /var/log/mail.err
