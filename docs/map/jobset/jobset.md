+++
title = "JobSet"
summary = "Several Jobs that start, fail and finish together"
aka = ["jobset.x-k8s.io/v1alpha2 JobSet"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/pod-template"
why = "Its pods get the shared overlays"
+++

`apiVersion: jobset.x-k8s.io/v1alpha2`, `kind: JobSet`.
