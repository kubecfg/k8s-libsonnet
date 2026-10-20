+++
title = "Istio"
band = "addons"
summary = "networking.istio.io and friends: service mesh traffic and security"
+++

Templates live in `k8s.libsonnet` under `k8s['networking.istio.io'].v1beta1` and `.v1alpha3`.

Checked against Istio 1.31.2: https://github.com/istio/istio/blob/1.31.2/manifests/charts/base/files/crd-all.gen.yaml
