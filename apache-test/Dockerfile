FROM registry.access.redhat.com/ubi7/ubi
LABEL maintainer="manintheit@gmail.com" \
      description="httpd is the Apache HyperText Transfer Protocol (HTTP) server program. It is designed to be run as a standalone daemon process.\
                   When used like this it will create a pool of child processes or threads to handle requests."

EXPOSE 8443 

RUN  yum install -y --setopt=tsflags=nodocs httpd && \
     yum clean all && \
     sed -i 's/^Listen.*/Listen 8443/g' /etc/httpd/conf/httpd.conf

COPY www.tar.gz /var/www/html

RUN  tar xfz /var/www/html/www.tar.gz -C /var/www/html --strip-components=1 && \
     rm -f /var/www/html/www.tar.gz 

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
