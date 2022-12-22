#!/bin/bash

echo "Criando imagens"

docker build -t heinrikduarte/projeto-backend:1.0 backend/.
docker build -t heinrikduarte/projeto-database:1.0 database/.

echo "Enviando imagens para o Docker Hub"
docker push heinrikduarte/projeto-backend:1.0
docker push heinrikduarte/projeto-database:1.0

echo "Criando servicos no cluster k8s"

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./deployments.yml