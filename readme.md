* Add an `.env` file containing the secrets (example in `.env.example`)
* Initialize your containerized web application and Postgresql database with the command `docker-compose -f docker-compose-video up`
* Initialize your container that creates the python package and publishes it with the command `docker compose -f docker-compose-pypi.yaml up`
