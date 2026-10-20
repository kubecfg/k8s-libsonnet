+++
title = "SelfSubjectRulesReview"
summary = "Lists what the caller may do"
aka = ["authorization.k8s.io/v1 SelfSubjectRulesReview"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: authorization.k8s.io/v1`, `kind: SelfSubjectRulesReview`, cluster-wide.

An API call, not a stored object.
