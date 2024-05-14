#!/usr/bin/env bash

docker compose \
    --env-file ./.docker/.db.env \
    --env-file ./.docker/.application.env \
    --env-file ./.docker/.pgadmin.env \
    -f ./.docker/compose.yml \
    up
    --build \
    --wait && \
docker exec -it backend sh ./.scripts/init-db.sh
