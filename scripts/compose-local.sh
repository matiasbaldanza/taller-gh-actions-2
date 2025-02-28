#!/bin/bash

# Construir la imagen de Docker
docker build -t next-basic:v1 ..

# Iniciar los contenedores en modo local
docker compose -f .docker/docker-compose.override.yml up -d

# Mostrar contenedores en ejecución
docker ps