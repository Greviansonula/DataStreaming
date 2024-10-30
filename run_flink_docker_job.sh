#!/bin/bash

# Step 1: Run docker compose in detached mode in folder x
echo "Starting Docker Compose in detached mode..."
cd /home/grevians/Desktop/DE/flink-ecommerce || exit 1
docker compose up -d

# Step 2: Start Flink cluster
echo "Starting Flink cluster..."
cd /home/grevians/Desktop/DE/flink-1.18.1 || exit 1
bin/start-cluster.sh

# Step 3: Build Flink project
echo "Building Flink project..."
cd /home/grevians/Desktop/DE/FlinkCommerce || exit 1
mvn clean
mvn compile
mvn package

# Step 4: Run the Flink job
echo "Running the Flink job..."
/home/grevians/Desktop/DE/flink-1.18.1/bin/flink run -c FlinkCommerce.DataStreamJob target/FlinkCommerce-1.0-SNAPSHOT.jar

echo "Script execution completed."
