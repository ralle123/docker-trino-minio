to run comtainers

```
docker-compose up
```

to close everything

```
docker-compose down
```




## MinIO container

once logging into container

### Add a bucket

s3cmd mb s3://flowers

### Add file(s) to a bucket

s3cmd -c s3minio.cfg put FILE [FILE...] s3://flowers

### list contents of a butcket

s3cmd ls s3://flowers


## Trino container

```
trino --execute "
CREATE SCHEMA IF NOT EXISTS minio.flowers
WITH (location = 's3a://flowers/');

CREATE TABLE IF NOT EXISTS minio.flowers.iris_parquet (
  sepal_length DOUBLE,
  sepal_width  DOUBLE,
  petal_length DOUBLE,
  petal_width  DOUBLE,
  class        VARCHAR
)
WITH (
  external_location = 's3a://flowers/',
  format = 'PARQUET'
);"

trino --execute "
SHOW TABLES IN minio.flowers;
SELECT * FROM minio.flowers.iris_parquet LIMIT 5;"
```
