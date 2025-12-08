# Docker Compose

> Docker Compose is a tool for defining and running multi-container
> applications. It is the key to unlocking a streamlined and efficient
> development and deployment experience.

---

## Basic Configuration

Consider a project with the following `Dockerfile`:

```dockerfile
# syntax=docker/dockerfile:1
FROM python:3.10-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run", "--debug"]
```

**Docker Compose** uses `compose.yaml` or `compose.yml` as its configuration file.

A simple service spins up `web` (defined with `Dockerfile`) in the project
folder, along with the `redis:alpine` image:

```yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
  redis:
    image: "redis:alpine"
```

The service can be started with `docker compose up` and stopped with `docker
compose down`.

If you wish to run the service in the background, run `docker compose up -d`.

## Compose Watch

As you edit and save project code, **Docker Compose** (through Compose Watch) can
automatically update your containers:

```yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
    develop:
      watch:
        - action: sync
          path: .
          target: /code
  redis:
    image: "redis:alpine"
```

Run **Compose Watch** for hot reloading using `docker compose watch` or `docker
compose up --watch`.

**Note:** This is similar in practice to using a bind mount, since Compose
Watch relies on the running application to hot reload from code changes. One
advantage of **Compose Watch** is that it respects `.dockerignore` files.

## Using Volumes

Volumes are named persistent drives attached to clusters in **Docker Compose**;
they persist between restarts. Volumes can be used to share folders between
different services.

This example shows a volume named `db-data` shared between two services:

```yaml
services:
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data

  backup:
    image: backup-service
    volumes:
      - db-data:/var/lib/backup/data

volumes:
  db-data:
```

## Environment Variables

**Docker Compose** can read environment variables from `compose.yaml`:

```yaml
services:
  webapp:
    environment:
      DEBUG: "true"
```

**Docker Compose** can also read `.env` files:

```yaml
services:
  webapp:
    env_file: "webapp.env"
```

## Miscellaneous Commands

Rebuild Docker images in a cluster:

```bash
docker compose build
```

List running services:

```bash
docker compose ps
```

Follow the live log tail of all running containers:

```bash
docker compose logs -f
```
