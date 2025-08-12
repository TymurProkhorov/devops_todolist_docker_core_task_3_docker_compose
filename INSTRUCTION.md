# Instructions for Running Todolist App with Docker Compose

## Prerequisites
- Docker installed (https://docs.docker.com/get-docker/)
- Docker Compose installed (https://docs.docker.com/compose/install/)

## Build and Start Containers
1. Clone the repository and go to the project root directory: \
   git clone <repo_url> \
   cd <project_dir>

2. Build and start services: \
docker compose up --build

Access the application:
The application will be available in your browser at:
http://localhost:8081


To stop containers: \
docker compose down \
This command stops and removes the containers.

To remove containers and volumes completely (to reset data): \
docker compose down -v