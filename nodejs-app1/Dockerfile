FROM registry.access.redhat.com/ubi7/ubi
ENV PORT=8080 \
    APP_ROOT=/usr/src/app \
    USER=nodeuser

LABEL maintainer=manintheit \
      app=nodejs \
      version=0.0.1

RUN yum install -y rh-nodejs14-npm && \ 
    yum clean all && \
    useradd -r -u 158600 -c "nodejs app user" -s /bin/false -m -d ${APP_ROOT} ${USER}

WORKDIR ${APP_ROOT}

COPY ["server.js", "package.json", "run-app.sh", "./"]

RUN chown -R ${USER}  ./ && \
    chmod u+x ./run-app.sh

EXPOSE ${PORT}
USER ${USER}
CMD ["./run-app.sh"]

