+++
title = "RoleBinding"
summary = "Gives a Role or ClusterRole to users, groups or service accounts"
aka = ["rbac.authorization.k8s.io/v1 RoleBinding"]
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
title = "RoleRef, ClusterRoleRef, UserRef, GroupRef and ServiceAccountRef helpers"
status = "done"
+++

`apiVersion: rbac.authorization.k8s.io/v1`, `kind: RoleBinding`.

`ServiceAccountRef` picks up the namespace set on the shared `ObjectMeta`.
