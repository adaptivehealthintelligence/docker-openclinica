# Docker environment for OpenClinica

This environment is not intended for production use, but rather for system testing and evaluation.

## Building the environment

The OpenClinica container is built in two stages. The first stage downloads and compiles the system. The second stage copies the required build artifacts into a `tomcat:8` container, and conifgures that container to run OpenClinica.

```bash
docker-compose build
```

## Starting up

See `docker-compose.yml` for the components of the system. Note that the PostgreSQL database state is stored in a named volume.

Start up the environment:

```bash
docker-compose up
```

## Logging in

Once the environment is running and initial setup is complete, you can log in.

Go to [http://localhost:8888](http://localhost:8888)

