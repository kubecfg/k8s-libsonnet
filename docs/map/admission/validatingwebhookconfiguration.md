+++
title = "ValidatingWebhookConfiguration"
summary = "Sends objects to a webhook that can reject them"
aka = ["admissionregistration.k8s.io/v1 ValidatingWebhookConfiguration"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: admissionregistration.k8s.io/v1`, `kind: ValidatingWebhookConfiguration`, cluster-wide.

Ships with every operator that has a validating webhook.
