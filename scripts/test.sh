#!/bin/bash

docker-compose exec -u www-data -T postgresql /scripts/create_test_schema.sh
docker-compose exec api .build/venv/bin/pytest ${@:-"--cov=c2corg_api"}
