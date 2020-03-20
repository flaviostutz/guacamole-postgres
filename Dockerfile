FROM guacamole/guacamole:1.1.0 AS BUILD
RUN /opt/guacamole/bin/initdb.sh --postgres > /pginitdb.sql


FROM postgres:9.6.17-alpine
COPY --from=BUILD /pginitdb.sql /docker-entrypoint-initdb.d/
