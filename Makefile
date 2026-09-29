.PHONY: up down restart logs build clean psql shell test

# Start all containers in background
up:
	docker compose up -d

# Start containers with live terminal logs (Foreground)
dev:
	docker compose up

# Stop all containers
down:
	docker compose down

# Force rebuild and start containers
build:
	docker compose up -d --build

# Restart containers
restart:
	docker compose restart

# View logs from all services (or use: make logs s=app)
logs:
	docker compose logs -f $(s)

# Open interactive PostgreSQL shell inside the DB container
psql:
	docker compose exec db psql -U postgres -d nest_dev

# Open interactive bash shell inside the NestJS app container
shell:
	docker compose exec app sh

# Stop containers and wipe database volume (Fresh Start)
clean:
	docker compose down -v
	rm -rf dist node_modules

# Run NestJS tests inside the container
test:
	docker compose exec app npm run test