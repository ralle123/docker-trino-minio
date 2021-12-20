FROM minio/minio:RELEASE.2021-04-22T15-44-28Z.hotfix.c1d7c4c9d

USER root
RUN microdnf install yum &&\
    yum update -y &&\
    yum -y install yum-utils &&\
    yum install -y wget python3 python3-pip &&\
    wget https://repo.almalinux.org/almalinux/8/BaseOS/aarch64/os/Packages/python3-magic-5.33-20.el8.noarch.rpm &&\
    yum install -y python3-magic-5.33-20.el8.noarch.rpm s3cmd
    
COPY minio.s3cfg /root/.s3cfg
WORKDIR /data
RUN mkdir iris
COPY /data/iris.parq /data/iris/iris.parq
# wget https://github.com/njanakiev/trino-minio-docker/blob/master/data/iris.parq
WORKDIR /
#USER minio
