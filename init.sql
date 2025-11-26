-- Create "greenlight" role with password auth
CREATE ROLE greenlight WITH LOGIN PASSWORD 'pa55word';

-- Grant privileges to the greenlight role on the database
GRANT ALL PRIVILEGES ON DATABASE greenlight TO greenlight;

-- Connect to the greenlight database to set schema permissions
\c greenlight;

-- Grant all privileges on the public schema to greenlight user
GRANT ALL ON SCHEMA public TO greenlight;

-- Grant privileges on all existing tables and sequences
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO greenlight;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO greenlight;

-- Grant default privileges for future objects
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO greenlight;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO greenlight;

-- Enable the citext extension
CREATE EXTENSION IF NOT EXISTS citext;
