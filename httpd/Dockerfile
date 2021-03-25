FROM ubi7/ubi:7.7
MAINTAINER manintheit "manintheit@gmail.com"
ENV PORT=8080
RUN yum install -y --setopt=tsflags=nodocs httpd && \
    yum clean all && \
    sed -i "s|^Listen\s.*80|Listen ${PORT}|g" /etc/httpd/conf/httpd.conf && \
    chown -R 48:48 /var/log/httpd && \
    chown -R 48:48 /run/httpd

EXPOSE ${PORT}
ADD ./src /var/www/html

USER apache
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
