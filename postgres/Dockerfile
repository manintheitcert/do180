FROM registry.access.redhat.com/ubi7/ubi:7.7

ARG POSTGRE_USER 
ARG POSTGRE_PASSWORD
ARG POSTGRE_DATABASE
ARG POSTGRE_ROOT_PASSWORD

ENV POSTGRE_USER=${POSTGRE_USER} \
    POSTGRE_PASSWORD=${POSTGRE_PASSWORD} \
    POSTGRE_DATABASE=${POSTGRE_DATABASE} \
    POSTGRE_ROOT_PASSWORD=${POSTGRE_ROOT_PASSWORD}
    

LABEL maintainer=manintheit@gmail.com \
      component=postgresql 
      

RUN yum install -y postgresql postgresql-server && \
    yum clean all && \
    rm -rf /var/yum/cache/

USER postgres

RUN initdb -D /var/lib/pgsql/data

ADD --chown=postgres ./conf/pg_hba.conf /var/lib/pgsql/data 
ADD --chown=postgres ./conf/postgresql.conf /var/lib/pgsql/data
ADD --chown=postgres ./entry-point-postgre.sh ./ 


EXPOSE 5432

VOLUME ["/var/lib/pgsql/data"]

CMD ["./entry-point-postgre.sh"]




      
