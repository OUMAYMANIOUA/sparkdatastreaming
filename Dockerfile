# Dockerfile
FROM apache/airflow:2.6.0-python3.9

USER airflow

# Installer les dépendances nécessaires
RUN pip install kafka-python requests


