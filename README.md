# SimpleBank

A simple banking backend service built with Go, PostgreSQL, and Docker. This project implements a RESTful API for basic banking operations including account management, money transfers, and user authentication.

## Features

- Account management (create, view, list)
- Money transfers between accounts
- User authentication with JWT tokens
- Database migrations with Goose
- Docker containerization

## Technology Stack

- **Backend**: Go
- **Database**: PostgreSQL
- **Authentication**: JWT
- **Migrations**: Goose
- **Code Generation**: SQLC
- **Containerization**: Docker

## Quick Start

### With Docker (Recommended)

```bash
git clone https://github.com/nuggetplum/simplebank.git
cd simplebank
docker-compose up -d
```

### Local Development

1. **Setup**
   ```bash
   git clone https://github.com/nuggetplum/simplebank.git
   cd simplebank
   go mod tidy
   ```

2. **Install tools**
   ```bash
   go install github.com/kyleconroy/sqlc/cmd/sqlc@latest
   go install github.com/pressly/goose/v3/cmd/goose@latest
   ```

3. **Setup database**
   ```bash
   createdb simple_bank
   goose -dir db/migration postgres "postgresql://username:password@localhost:5432/simple_bank?sslmode=disable" up
   ```

4. **Run**
   ```bash
   sqlc generate
   go run main.go
   ```

## API Endpoints

### Authentication
- `POST /users` - Register user
- `POST /users/login` - Login
- `POST /tokens/renew_access` - Refresh token

### Accounts
- `POST /accounts` - Create account
- `GET /accounts/:id` - Get account
- `GET /accounts` - List accounts

### Transfers
- `POST /transfers` - Transfer money

## Testing

```bash
# Run all tests
go test -v ./...

# Run with coverage
go test -v -cover ./...
```

## Database

The app uses PostgreSQL with these tables:
- `users` - User accounts
- `accounts` - Bank accounts
- `entries` - Transaction records
- `transfers` - Money transfers
- `sessions` - User sessions

## Project Structure

```
├── api/           # HTTP handlers
├── db/
│   ├── migration/ # Database migrations
│   ├── query/     # SQL queries
│   └── sqlc/      # Generated code
├── token/         # JWT implementation
├── util/          # Utilities
└── main.go
```

## Contributing

1. Fork the repo
2. Create a feature branch
3. Make changes
4. Run tests
5. Submit PR

## License

MIT License
