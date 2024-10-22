# Dungeon Master


## To build Docker Dev Container run 

```bash
`docker build -f Dockerfile.dev -t <preferred-image-name> .`
```

```bash
docker run -d <preferred-image-name> tail -f /dev/null
```

```bash
CONTAINER_ID=$(docker ps --filter ancestor=<preferred-image-name> --format "{{.ID}}" | head -n 1)
docker exec -it $CONTAINER_ID /bin/bash
```
