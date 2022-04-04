# Anthos Crash Course: Intro to ACM

This demo repository was used during Anthos Crash Course event hosted by SADA.

A script is provided that will setup a demo environment using the `gcloud` CLI, when provided a project and zone. The `setup.sh` script will:
* Enable the required services in the project
* Create 3 GKE clusters
* Register the 3 GKE clusters to Anthos
* Configure config management to enable sync from this repository, and enable policy controller

**NOTE:** The resources will cost money.

When done with the environment, the `destroy.sh` script will remove the resources.
