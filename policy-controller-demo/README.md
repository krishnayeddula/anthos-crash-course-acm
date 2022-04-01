# Policy Controller Demo

This directory contains two other directories with Policy Controller examples: `privileged-containers` and `config-connector`.

`privileged-containers` borrows a sample policy from the [Gatekeeper Open Source Library](https://github.com/open-policy-agent/gatekeeper-library). This policy will block any privileged containers from running in a cluster.

The `config-connector` directory shows off a custom policy that blocks any [Google Cloud Config Connector](https://cloud.google.com/config-connector/docs/overview) storage buckets from being created without the uniform bucket-level access security control.