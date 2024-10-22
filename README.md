# Dungeon Master


## To build Docker Dev Container Run the Following Commands

```bash
`docker build -f Dev.Dockerfile -t <preferred-image-name> .`
```

```bash
docker run -d <preferred-image-name> tail -f /dev/null
```

```bash
CONTAINER_ID=$(docker ps --filter ancestor=<preferred-image-name> --format "{{.ID}}" | head -n 1)
docker exec -it $CONTAINER_ID /bin/bash
```
