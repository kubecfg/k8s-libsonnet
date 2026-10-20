+++
title = "Cluster-scoped"
summary = "Hides the shared namespace on kinds that live outside namespaces"
kind = "lib"
intent = "induced"
research = "done"
refs = ["k8s.libsonnet"]
status = "done"
+++

The templates for cluster-wide kinds add `clusterScoped`, which hides `metadata.namespace`. Without it, a namespace set on the shared `ObjectMeta` would show up on the object.

Kinds without a template, written as `k8s.Object { apiVersion, kind }` or brought in with `k8s.adopt`, don't get this. A `StorageClass` written that way comes out with `metadata.namespace` set. That is why the cluster-wide kinds have their own milestone.
