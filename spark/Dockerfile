FROM apache/spark:3.5.0

USER root

# Installer Python et pip + driver Cassandra
RUN apt-get update && apt-get install -y python3-pip python3-dev wget \
    && pip3 install cassandra-driver

# Remettre l’utilisateur spark
USER spark
WORKDIR /opt/spark-apps
