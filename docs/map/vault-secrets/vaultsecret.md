+++
title = "VaultSecret"
summary = "Copies secrets from Vault into a Kubernetes Secret"
aka = ["maupu.org/v1beta1 VaultSecret"]
kind = "crd"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "template"
title = "Template with apiVersion and kind"
status = "done"

[[feature]]
id = "defaults"
title = "Default Vault Kubernetes auth settings"
status = "done"

[[feature]]
id = "secrets"
title = "secrets_ keyed by path"
status = "done"
+++

`apiVersion: maupu.org/v1beta1`, `kind: VaultSecret`.

The upstream project has had no commits since February 2023.
