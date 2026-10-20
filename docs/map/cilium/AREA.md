+++
title = "Cilium"
band = "addons"
summary = "cilium.io: networking, network policy and BGP"
+++

No templates in `k8s.libsonnet` yet. Kinds without a template still work through `k8s.Object { apiVersion, kind }`.

Checked against Cilium v1.20.3: https://github.com/cilium/cilium/tree/v1.20.3/pkg/k8s/apis/cilium.io/client/crds
