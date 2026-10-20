+++
title = "SubjectAccessReview"
summary = "Asks whether someone may do something"
aka = ["authorization.k8s.io/v1 SubjectAccessReview"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: authorization.k8s.io/v1`, `kind: SubjectAccessReview`, cluster-wide.

An API call, not a stored object.
