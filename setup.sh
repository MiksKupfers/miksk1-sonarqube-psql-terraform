#!/bin/bash
SONARQUBE_HOST=sonarqube.local

echo "Starting Minikube with Docker driver"
minikube start --driver=docker
echo "Minikube started successfully."

echo "Enabling Minikube Ingress addon"
minikube addons enable ingress
echo "Ingress addon enabled successfully."

echo "Initializing and applying Terraform"
terraform init
echo "Terraform initialized successfully."

terraform apply -input=false -auto-approve -var sonarqube_host=$SONARQUBE_HOST
NGNIX_INGRESS=$(minikube ip)
echo "Use http://$SONARQUBE_HOST:80/ to access Sonarqube and add..."
echo "$NGNIX_INGRESS      $SONARQUBE_HOST"