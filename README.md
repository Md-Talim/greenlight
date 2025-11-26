# Greenlight

A JSON API for retrieving and managing movie information, built as a learning project while following the "Let's Go Further" book.

## API Endpoints

| Method   | URL Pattern       | Action                              |
| -------- | ----------------- | ----------------------------------- |
| `GET`    | `/v1/healthcheck` | Show application health and version |
| `GET`    | `/v1/movies`      | Show all movies                     |
| `POST`   | `/v1/movies`      | Create a new movie                  |
| `GET`    | `/v1/movies/:id`  | Show specific movie details         |
| `PATCH`  | `/v1/movies/:id`  | Update movie details                |
| `DELETE` | `/v1/movies/:id`  | Delete a movie                      |
| `POST`   | `/v1/users`       | Register a new user                 |

## Features

- RESTful JSON API
- PostgreSQL database integration
- User registration and authentication
- Email notifications
- Rate limiting
- Input validation
- CORS support
- SQL migrations with golang-migrate
- Graceful shutdown

## Prerequisites

- Go 1.25+
- Docker and Docker Compose
- [golang-migrate](https://github.com/golang-migrate/migrate) CLI tool

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Md-Talim/greenlight.git
cd greenlight
```

### 2. Start the PostgreSQL database

Using Docker Compose to spin up a local PostgreSQL instance:

```bash
docker-compose up -d
```

This will start a PostgreSQL database on port 5432 with:

- Database: `greenlight`
- Username: `postgres`
- Password: `postgres`

### 3. Set environment variables

```bash
export GREENLIGHT_DB_DSN="postgres://postgres:postgres@localhost/greenlight?sslmode=disable"
```

### 4. Run database migrations

Use the golang-migrate tool to set up the database schema:

```bash
migrate -path=./migrations -database=$GREENLIGHT_DB_DSN up
```

### 5. Start the API server

```bash
go run ./cmd/api
```

The API will be available at `http://localhost:4000` by default.

## Configuration

The application accepts various command-line flags:

- `-port`: API server port (default: 4000)
- `-env`: Environment (development|staging|production)
- `-db-dsn`: PostgreSQL connection string
- `-limiter-rps`: Rate limiter requests per second
- `-limiter-enabled`: Enable/disable rate limiting

## Database Management

Migrations are managed using [golang-migrate](https://github.com/golang-migrate/migrate):

- Apply migrations: `migrate -path=./migrations -database=$GREENLIGHT_DB_DSN up`
- Rollback migrations: `migrate -path=./migrations -database=$GREENLIGHT_DB_DSN down`
