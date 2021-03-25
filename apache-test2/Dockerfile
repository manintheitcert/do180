FROM registry.access.redhat.com/ubi7/ubi 

ARG ServerName=manintheit.homelab.io 
ARG PORT=8443

LABEL maintainer="manintheit@gmail.com" \
      description="The Apache HTTP Server Project is an effort to develop and maintain an open-source HTTP server for modern operating systems including UNIX and Windows.\
      The goal of this project is to provide a secure, efficient and extensible server that provides HTTP services in sync with the current HTTP standards. \
      The Apache HTTP Server (\"httpd\") was launched in 1995 and it has been the most popular web server on the Internet since April 1996. \
      It has celebrated its 25th birthday as a project in February 2020." \
      company=manintheit

RUN  yum install -y --setopt=tsflags=nodocs httpd && \
     yum clean all && \
     chown -R apache:apache /var/log/httpd && \
     chown -R apache:apache /run/httpd && \
     sed -i "s|^Listen\s.*|Listen ${PORT}|g" /etc/httpd/conf/httpd.conf && \
     sed -i "s|^#ServerName.*|ServerName ${ServerName}|g" /etc/httpd/conf/httpd.conf
    
COPY ./www.tar.gz /var/www/html

RUN  tar xfz /var/www/html/www.tar.gz -C /var/www/html --strip-components=1 && \
     rm -f /var/www/html/www.tar.gz 

EXPOSE ${PORT}
USER apache  

CMD ["/usr/sbin/httpd","-D", "FOREGROUND"]


