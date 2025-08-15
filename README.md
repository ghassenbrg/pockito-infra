# Pockito Infrastructure

This directory contains the Docker Compose configuration for the Pockito application infrastructure.

## Services

- **PostgreSQL 16**: Database server
- **Keycloak 24.0**: Authentication and authorization server

## Quick Start

1. **Copy environment variables**:
   ```bash
   cp .env.example .env
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

### Import Realm Configuration

1. **Access Keycloak Admin Console**:
   - URL: http://localhost:8081
   - Username: `admin`
   - Password: `admin` (or as set in `.env`)

2. **Import Realm**:
   - Click "Add realm"
   - Click "Select file"
   - Choose `keycloak/realm-pockito.json`
   - Click "Create"

3. **Verify Configuration**:
   - Realm "pockito" should be created
   - Two roles: `USER` and `ADMIN`
   - Two clients: `pockito-api` and `pockito-web`

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

## Database Access

- **Host**: localhost
- **Port**: 5432
- **Database**: pockito
- **Username**: pockito
- **Password**: pockito

## Health Checks

Both services include health checks:
- **PostgreSQL**: Uses `pg_isready`
- **Keycloak**: Uses HTTP endpoint check

## Troubleshooting

### Keycloak Not Starting
- Ensure PostgreSQL is running and healthy
- Check logs: `docker-compose logs keycloak`

### Database Connection Issues
- Verify PostgreSQL is running: `docker-compose ps`
- Check logs: `docker-compose logs db`

### Port Conflicts
- Ensure ports 5432 and 8081 are available
- Modify ports in `docker-compose.yml` if needed
