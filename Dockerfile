FROM kartoza/postgis:latest

MAINTAINER Mila Frerichs<mila@civicivision.de>

ENV POSTGRES_VERSION=9.4

# Adjust PostgreSQL configuration so that remote connections to the database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/$POSTGRES_VERSION/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/$POSTGRES_VERSION/main/postgresql.conf


# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD /start-postgis.sh
