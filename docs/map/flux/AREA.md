+++
title = "Flux"
band = "addons"
summary = "toolkit.fluxcd.io groups: GitOps deployment"
+++

No templates in `k8s.libsonnet` yet. Kinds without a template still work through `k8s.Object { apiVersion, kind }`.

Checked against Flux v2.9.6: https://github.com/fluxcd/flux2/releases/download/v2.9.6/install.yaml. Kinds come from several groups: source, kustomize, helm, notification and image (all .toolkit.fluxcd.io).
