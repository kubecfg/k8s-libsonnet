+++
title = "kro"
band = "official"
summary = "kro.run: define new APIs as graphs of resources"
+++

No templates in `k8s.libsonnet` yet. Kinds without a template still work through `k8s.Object { apiVersion, kind }`.

Checked against kro v0.9.4: https://github.com/kubernetes-sigs/kro/releases/download/v0.9.4/kro-core-install-manifests.yaml. Each ResourceGraphDefinition creates a new CRD of its own; those are not mapped.
