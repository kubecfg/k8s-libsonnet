+++
title = "ClusterRoleBinding"
summary = "Gives a ClusterRole across the cluster"
aka = ["rbac.authorization.k8s.io/v1 ClusterRoleBinding"]
kind = "builtin"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "template"
title = "Template with apiVersion and kind"
status = "done"

[[feature]]
id = "refs"
title = "ClusterRoleRef, UserRef, GroupRef and ServiceAccountRef helpers"
status = "done"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: rbac.authorization.k8s.io/v1`, `kind: ClusterRoleBinding`, cluster-wide.
