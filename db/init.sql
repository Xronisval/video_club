CREATE DATABASE deus;
CREATE USER deususer WITH ENCRYPTED PASSWORD 'deuspass';
ALTER ROLE deususer SET client_encoding TO 'utf8';
ALTER ROLE deususer SET default_transaction_isolation TO 'read committed';
ALTER ROLE deususer SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE deus TO deususer;
ALTER USER deususer CREATEDB;
\q
