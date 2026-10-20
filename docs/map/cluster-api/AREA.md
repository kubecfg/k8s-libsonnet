+++
title = "Cluster API"
band = "official"
summary = "cluster.x-k8s.io and friends: clusters managed as Kubernetes objects"
+++

No templates in `k8s.libsonnet` yet. Kinds without a template still work through `k8s.Object { apiVersion, kind }`.

Checked against Cluster API v1.14.3 (core, kubeadm bootstrap and control plane, IPAM, runtime extensions): https://github.com/kubernetes-sigs/cluster-api/releases/download/v1.14.3/cluster-api-components.yaml. Infrastructure providers add their own kinds and are not mapped.
