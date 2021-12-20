FROM trinodb/trino:351
COPY requirements.txt /
USER root
RUN yum update -y &&\
    yum -y install yum-utils &&\
    yum -y install https://repo.ius.io/ius-release-el7.rpm &&\
    yum install -y python3 python3-pip

WORKDIR /
RUN pip3 install -r requirements.txt &&\
    echo "alias trino='bin/trino'" >> ~/.bashrc

#RUN yum -y install s3cmd openjdk-11-jre-headless  # Needed for trino-cli

USER trino:trino

#wget https://github.com/njanakiev/trino-minio-docker/blob/master/data/iris.parq
#