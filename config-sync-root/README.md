# Config Sync Demo

This directory contains the resources that will be syncronized to the clusters. It contains the following subdirectories:
* `cluster-registry` which contains the cluster and cluster selector configuration for this demo
* `namespaces` which contains some namespaces provisioned with this repository
* `platform` which contains some platform tooling provisioned with this repository
* `policy` which contains policy configuration privisioned with this repository

This repository uses automatic hydration using Kustomize and Helm to support dry configuration as source.
