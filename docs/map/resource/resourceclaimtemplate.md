+++
title = "ResourceClaimTemplate"
summary = "Lets each pod ask for its own device, such as a GPU"
aka = ["resource.k8s.io/v1 ResourceClaimTemplate"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m3"
+++

`apiVersion: resource.k8s.io/v1`, `kind: ResourceClaimTemplate`.

The usual way pods ask for devices with dynamic resource allocation (GA in Kubernetes 1.34).
