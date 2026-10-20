+++
title = "MutatingWebhookConfiguration"
summary = "Sends objects to a webhook that can change them"
aka = ["admissionregistration.k8s.io/v1 MutatingWebhookConfiguration"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: admissionregistration.k8s.io/v1`, `kind: MutatingWebhookConfiguration`, cluster-wide.

Ships with every operator that has a mutating webhook.
