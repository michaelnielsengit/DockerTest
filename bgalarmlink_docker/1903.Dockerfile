FROM beumergroup/html5_baseimage:1903

COPY packages /systems/packages/
COPY bgalarmlink /systems/bgalarmlink/

COPY bgalarmlink/dbscripts/AlarmLinkDB/*.sql ./
COPY install/* ./install/

ENV ENVIRONMENT developer

RUN ["cmd", "/C", "cd install & docker_install.cmd"]

EXPOSE 7289/tcp 7291/tcp

CMD ["cmd", "/C", "cd install & docker_start.cmd"]
