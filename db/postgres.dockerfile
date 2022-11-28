FROM postgres:14.6-alpine

COPY db/init.sql docker-entrypoint-initdb.d
