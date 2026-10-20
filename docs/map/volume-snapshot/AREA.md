+++
title = "Volume snapshots"
band = "official"
summary = "snapshot.storage.k8s.io: point-in-time copies of volumes"
+++

No templates in `k8s.libsonnet` yet. Kinds without a template still work through `k8s.Object { apiVersion, kind }`.

Checked against external-snapshotter v8.7.0: https://github.com/kubernetes-csi/external-snapshotter/tree/v8.7.0/client/config/crd
