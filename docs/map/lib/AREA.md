+++
title = "Library"
band = "lib"
summary = "Shared pieces of k8s.libsonnet that the templates are built on"
+++

Every template starts from `k8s.Object`, whose `metadata` extends the shared `ObjectMeta`. Overriding `ObjectMeta` or `ObjectTemplateMeta` changes every object at once.
