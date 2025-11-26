#!/bin/bash
#airflow should follow this file when start to initialise the webserver or scheduler
set -e

#Vérifie si un fichier requirements.txt existe
#Met à jour pip et installe les packages Python listés

if [ -e "/opt/airflow/requirements.txt" ]; then
  $(command python) pip install --upgrade pip
  $(command -v pip) install --user -r requirements.txt
fi

#Initialisation de la base de données Airflow
#Si la base de données n'existe pas, il l'initialise

#Crée un utilisateur admin par défaut
if [ ! -f "/opt/airflow/airflow.db" ]; then
  airflow db init && \
  airflow users create \
    --username admin \
    --firstname admin \
    --lastname admin \
    --role Admin \
    --email admin@example.com \
    --password admin
fi
#Mise à jour de la base de données
#Applique les migrations de base de données si nécessaire
$(command -v airflow) db upgrade

#Démarrage du serveur web
#Lance le serveur web d'Airflow
exec airflow webserver