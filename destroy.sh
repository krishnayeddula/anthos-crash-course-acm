#!/bin/bash

help() {
  echo "Destroy ACM Demo environment"
  echo
  echo "Syntax: destroy.sh {project-id} {zone}"
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

for CLUSTER_NAME in ${CLUSTERS[@]}; do
  echo "Deleting Cluster: $CLUSTER_NAME"
  gcloud beta container clusters delete $CLUSTER_NAME --zone $DEMO_ZONE --project $DEMO_PROJECT_ID --quiet
  
  echo "Unregistering Cluster: $CLUSTER_NAME"
  gcloud container hub memberships delete $CLUSTER_NAME --project $DEMO_PROJECT_ID --quiet
done
