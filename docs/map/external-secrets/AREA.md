+++
title = "External Secrets"
band = "addons"
summary = "external-secrets.io: syncs secrets from outside stores"
+++

No templates in `k8s.libsonnet` yet. Kinds without a template still work through `k8s.Object { apiVersion, kind }`.

Checked against External Secrets v2.13.0: https://github.com/external-secrets/external-secrets/blob/v2.13.0/deploy/crds/bundle.yaml. The 19 secret generator kinds in generators.external-secrets.io (Password, ECRAuthorizationToken, ...) are not mapped one by one.
