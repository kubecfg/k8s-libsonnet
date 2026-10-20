+++
title = "MutatingAdmissionPolicy"
summary = "In-process mutation rules written in CEL"
aka = ["admissionregistration.k8s.io/v1 MutatingAdmissionPolicy"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: admissionregistration.k8s.io/v1`, `kind: MutatingAdmissionPolicy`, cluster-wide.

New in v1; wait and see how much it is used.
