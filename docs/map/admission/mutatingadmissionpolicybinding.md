+++
title = "MutatingAdmissionPolicyBinding"
summary = "Turns a MutatingAdmissionPolicy on for some objects"
aka = ["admissionregistration.k8s.io/v1 MutatingAdmissionPolicyBinding"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: admissionregistration.k8s.io/v1`, `kind: MutatingAdmissionPolicyBinding`, cluster-wide.
