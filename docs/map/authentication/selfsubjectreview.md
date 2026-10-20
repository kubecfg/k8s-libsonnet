+++
title = "SelfSubjectReview"
summary = "Asks who the caller is"
aka = ["authentication.k8s.io/v1 SelfSubjectReview"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: authentication.k8s.io/v1`, `kind: SelfSubjectReview`, cluster-wide.

An API call, not a stored object.
