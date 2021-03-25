FROM registry.access.redhat.com/ubi7/ubi-minimal
ENV  PORT=8080
LABEL maintainer="manintheit@gmail.com" \
      app="flask" \
      version="0.0.1"

# shadow-utils is needed for having adduser groupadd commands
RUN microdnf install --enablerepo=rhel-7-server-rpms shadow-utils python36 && \
    groupadd -g 155600 app-group && \
    useradd -u 155600 -g 155600 -m -d /opt/app-user -s '/bin/false' -c "Flask app user" --system app-user && \ 
    python3.6 -m venv /opt/app-user/app
  
COPY ./src /opt/app-user/app
WORKDIR /opt/app-user/app
RUN chmod u+x ./run-app.sh && \
    chown -R app-user:app-group /opt/app-user/app && \
    source ./bin/activate && \
    python3 -m pip  install  flask && \
    python3 -m pip install   gunicorn

USER app-user   
EXPOSE $PORT
#ENTRYPOINT [ "./run-app.sh" ]
CMD ["./run-app.sh"]







