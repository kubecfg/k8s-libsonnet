+++
title = "Argo CD"
band = "addons"
summary = "argoproj.io: GitOps deployment"
+++

No templates in `k8s.libsonnet` yet. Kinds without a template still work through `k8s.Object { apiVersion, kind }`.

Checked against Argo CD v3.5.5: https://github.com/argoproj/argo-cd/tree/v3.5.5/manifests/crds. Argo Rollouts and Argo Workflows share the argoproj.io group but are separate projects, not mapped.
