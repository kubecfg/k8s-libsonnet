+++
title = "ValidatingAdmissionPolicy"
summary = "In-process validation rules written in CEL"
aka = ["admissionregistration.k8s.io/v1 ValidatingAdmissionPolicy"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: admissionregistration.k8s.io/v1`, `kind: ValidatingAdmissionPolicy`, cluster-wide.

v1 since Kubernetes 1.30.
