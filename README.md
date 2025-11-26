# Data Engineer Project - Spark Streaming, Cassandra & Airflow

## Description
Ce projet est une **application de streaming de données en temps réel** utilisant **Apache Spark**, **Kafka**, **Cassandra** et **Apache Airflow**.  
L'application consomme des messages JSON depuis un **topic Kafka**, les transforme avec Spark, puis les stocke dans une table **Cassandra**.  
Airflow est utilisé pour **orchestrer le flux de données**, automatiser la récupération des données et le déclenchement du streaming Spark.

---

## Architecture du projet

![Architecture](images/architecture.png)

1. **Kafka** : message broker qui reçoit les événements d’utilisateurs créés et les stocke dans le topic `users_created`.  
2. **Spark Streaming** : lit les messages Kafka, transforme les données, et les prépare pour Cassandra.  
3. **Cassandra** : base de données NoSQL où les données transformées sont stockées en temps réel.  
4. **Airflow** : orchestre le workflow, planifie les tâches de récupération et de streaming des données.

---

## Fonctionnalités principales

- Connexion à Kafka pour lire un topic `users_created`.  
- Transformation des messages JSON en **DataFrame Spark**.  
- Connexion à Cassandra et création de keyspace + table si elles n’existent pas.  
- Écriture des données dans Cassandra en **temps réel**.  
- Orchestration du flux de données via **Airflow DAG**.  

---

## Technologies utilisées

| Technologie | Rôle dans le projet |
|------------|-------------------|
| **Python 3.11** | Langage principal pour Spark Streaming et interaction avec Cassandra |
| **Apache Spark 3.5** | Traitement de données en streaming et transformations |
| **Apache Kafka 3.x** | Message broker pour transporter les événements |
| **Cassandra 5.x** | Stockage NoSQL pour les données utilisateur |
| **Docker & Docker Compose** | Conteneurisation et déploiement rapide des services |
| **Apache Airflow** | Orchestration et automatisation du workflow |
| **PySpark** | Interface Python pour Spark |
| **cassandra-driver** | Connexion Python à Cassandra |

---

## Images explicatives

![docker ](images/docker.png)  


![broker kafka ](images/brokerkafka.png)  


![topic kafka](images/user_created.png)  
*Les données transformées sont insérées dans Cassandra.*

![Airflow DAG](images/airflow.png)  
*Airflow orchestre le workflow de streaming et récupération de données.*

![donnees dans cassandra](images/cassandradata.png)  
*Flux de données complet : Kafka → Spark Streaming → Cassandra, orchestré par Airflow.*

---

## Étapes d'installation et exécution

### 1️⃣ Cloner le projet
git clone https://github.comOUMAYMANIOUA/sparkdatastreaming.git

cd DataEngineerProject

2️⃣ Créer et activer un environnement virtuel
python -m venv .venv
.venv\Scripts\activate

3️⃣ Installer les dépendances Python
pip install -r requirements.txt

4️⃣ Démarrer Kafka, Cassandra et Airflow avec Docker
docker-compose up -d

7️⃣ Lancer l'application Spark Streaming
python scripts/spark_stream.py

8️⃣ Vérifier les données dans Cassandra
docker exec -it cassandra cqlsh
USE spark_streams;
SELECT * FROM created_users;

9️⃣ Suivre les DAGs Airflow

Connectez-vous à Airflow (localhost:8080)

Visualisez et déclenchez le DAG de streaming 


---
Conclusion

Ce projet illustre l'intégration de Kafka, Spark Streaming, Cassandra et Airflow pour un pipeline de données en temps réel, avec une orchestration complète du workflow et un stockage rapide dans une base NoSQL
