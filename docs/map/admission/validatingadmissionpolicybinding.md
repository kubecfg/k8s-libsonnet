+++
title = "ValidatingAdmissionPolicyBinding"
summary = "Turns a ValidatingAdmissionPolicy on for some objects"
aka = ["admissionregistration.k8s.io/v1 ValidatingAdmissionPolicyBinding"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: admissionregistration.k8s.io/v1`, `kind: ValidatingAdmissionPolicyBinding`, cluster-wide.
