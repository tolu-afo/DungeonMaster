# Dungeon Master

```bash
docker build -t dungeon-master .
```

```bash
docker run -d dungeon-master tail -f /dev/null
```

```bash
CONTAINER_ID=$(docker ps --filter ancestor=dungeon-master --format "{{.ID}}" | head -n 1)
docker exec -it $CONTAINER_ID /bin/bash
```


