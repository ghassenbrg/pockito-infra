# Pockito Infrastructure

This directory contains the Docker Compose configuration for the Pockito application infrastructure.

## Services

- **PostgreSQL 16**: Database server for Pockito application
- **Keycloak PostgreSQL**: Database server for Keycloak (separate instance)
- **Keycloak 25.0**: Authentication and authorization server

## Quick Start

1. **Copy environment variables**:
   ```bash
   cp env.example .env
   ```

2. **Start services**:
   ```bash
   docker-compose up -d
   ```

3. **Verify services are running**:
   ```bash
   docker-compose ps
   ```

## Keycloak Setup

### Automatic Realm Import

The realm configuration is automatically imported on first startup:

1. **Realm Configuration**: `keycloak/realm-pockito.json` is automatically imported
2. **Pre-configured Elements**:
   - Realm "pockito" with USER and ADMIN roles
   - Two clients: `pockito-api` and `pockito-web`
   - Test user `gbargougui` with USER role

### Access Keycloak Admin Console

- **URL**: http://localhost:8081
- **Username**: `admin`
- **Password**: `admin` (or as set in `.env`)

### Client Configuration

#### pockito-api (Backend)
- **Type**: Confidential
- **Service Accounts**: Enabled
- **Redirect URIs**: http://localhost:8080/*
- **Scopes**: profile, roles, email

#### pockito-web (Frontend)
- **Type**: Public
- **Redirect URIs**: http://localhost:4200/*
- **Web Origins**: http://localhost:4200
- **Scopes**: profile, roles, email

## Test User

A test user is included in the realm configuration:

- **Username**: `gbargougui`
- **Password**: `gbargougui`
- **Name**: Ghassen Bargougui
- **Email**: ghassen.brg27@gmail.com
- **Role**: USER

This user can be used for testing the application authentication.

## Database Access

### Pockito Application Database
- **Host**: localhost
- **Port**: 5432
- **Database**: pockito
- **Username**: pockito
- **Password**: pockito

### Keycloak Database
- **Host**: localhost
- **Port**: 5433 (separate container)
- **Database**: keycloak
- **Username**: keycloak
- **Password**: keycloak

## Data Persistence

Both databases use Docker volumes for data persistence:

- **Pockito Database**: `pgdata` volume
- **Keycloak Database**: `keycloak_pgdata` volume

Data will persist across container restarts and updates.

## Health Checks

All services include health checks:
- **PostgreSQL (Pockito)**: Uses `pg_isready`
- **PostgreSQL (Keycloak)**: Uses `pg_isready`
- **Keycloak**: Uses HTTP health endpoint

## Environment Variables

Copy `env.example` to `.env` and customize as needed:

```bash
# PostgreSQL Database (for Pockito app)
POSTGRES_DB=pockito
POSTGRES_USER=pockito
POSTGRES_PASSWORD=pockito

# Keycloak Admin
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=admin

# Keycloak Database
KEYCLOAK_DB=keycloak
KEYCLOAK_DB_USER=keycloak
KEYCLOAK_DB_PASSWORD=keycloak
```

## Troubleshooting

### Keycloak Not Starting
- Ensure Keycloak PostgreSQL is running and healthy
- Check logs: `docker-compose logs keycloak`

### Database Connection Issues
- Verify PostgreSQL services are running: `docker-compose ps`
- Check logs: `docker-compose logs db` or `docker-compose logs keycloak-db`

### Port Conflicts
- Ensure ports 5432, 5433, and 8081 are available
- Modify ports in `docker-compose.yml` if needed

### Realm Import Issues
- Check Keycloak logs for import errors
- Verify `keycloak/realm-pockito.json` is valid JSON
- Realm import only happens on first startup with empty database
