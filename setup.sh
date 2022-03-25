#!/bin/bash

help() {
  echo "Setup ACM Demo environment"
  echo
  echo "Syntax: setup.sh {project-id} {zone}"
  echo "where:"
  echo "  project-id  is the project where the environment will be deployed"
  echo "  zone        is zone where the environment will be deployed"
  echo
}

# These correspond to the clusters in `config-sync-root/cluster-registry`
CLUSTERS=("acm-demo-dev" "acm-demo-stage" "acm-demo-prod")

if [ -z "$1" ] | [ -z "$2" ]; then
  echo "Missing Arguments"
  echo
  help
  exit 1
fi

DEMO_PROJECT_ID=$1
DEMO_ZONE=$2

# TODO: Enable services

for CLUSTER_NAME in ${CLUSTERS[@]}; do
  echo "Creating Cluster: $CLUSTER_NAME"
  gcloud beta container clusters create $CLUSTER_NAME --zone $DEMO_ZONE --project $DEMO_PROJECT_ID \
    --preemptible --num-nodes "2" --machine-type "e2-standard-4" --enable-ip-alias \
    --workload-pool "${DEMO_PROJECT_ID}.svc.id.goog" --logging=SYSTEM,WORKLOAD --monitoring=SYSTEM 
  
  echo "Registering Cluster: $CLUSTER_NAME"
  gcloud container hub memberships register $CLUSTER_NAME --project $DEMO_PROJECT_ID \
    --gke-cluster $DEMO_ZONE/$CLUSTER_NAME --enable-workload-identity
  
  echo "Enabling ACM: $CLUSTER_NAME"
  gcloud beta container hub config-management apply --project $PROJECT_ID \
    --membership $CLUSTER_NAME --config apply-spec.yaml
done
