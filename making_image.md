making_image.md

### check linux version

cat /etc/os-release

### remove all images

docker system prune -a

docker build --no-cache -t trino_test .
docker run -it trino_test sh

docker build --no-cache -t ralle/trino-img:001 -f trino.Dockerfile .
docker push ralle123/minio-img:002

### to go into running container

docker exec -it <container id> sh


mkdir -p ~/minio/data

### running minio only

docker run \
  -p 9000:9000 \
  -p 9001:9001 \
  --name minio1 \
  -v ~/minio/data:/data \
  -e "MINIO_ROOT_USER=minio_access_key" \
  -e "MINIO_ROOT_PASSWORD=minio_secret_key" \
  quay.io/minio/minio server /data --console-address ":9001"

  docker run \
  -p 9000:9000 \
  -p 9001:9001 \
  --name minio1 \
  -v ~/code/trino-minio-docker/data:/data \
  -e "MINIO_ROOT_USER=minio_access_key" \
  -e "MINIO_ROOT_PASSWORD=minio_secret_key" \
  minio/minio:latest server /data --console-address ":9001"

