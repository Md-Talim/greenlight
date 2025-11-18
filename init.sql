-- Create "greenlight" role with password auth
CREATE ROLE greenlight WITH LOGIN PASSWORD 'pa55word';

-- Switch to the greenlight DB
\c greenlight;

-- Enable the citext extension
CREATE EXTENSION IF NOT EXISTS citext;
