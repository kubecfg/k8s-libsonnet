+++
title = "Kyverno"
band = "addons"
summary = "policies.kyverno.io and kyverno.io: policy engine"
+++

No templates in `k8s.libsonnet` yet. Kinds without a template still work through `k8s.Object { apiVersion, kind }`.

Checked against Kyverno v1.19.1: https://github.com/kyverno/kyverno/releases/download/v1.19.1/install.yaml. The older kyverno.io policy kinds are still served but deprecated in favour of policies.kyverno.io.
