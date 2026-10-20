+++
title = "PodTemplateSpec"
summary = "One pod template that every pod-creating kind extends"
kind = "lib"
intent = "induced"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "overlays"
title = "k8s.v1.PodTemplateSpec: overlays on it reach every pod"
status = "done"

[[feature]]
id = "default-container"
title = "Sets kubectl.kubernetes.io/default-container when one container is not a sidecar"
status = "done"

[[feature]]
id = "named-arrays"
title = "containers_, initContainers_, volumes_; and env_, ports_, volumeMounts_ in each container"
status = "done"
needs = ["/lib/named-arrays"]
+++

Labels and annotations in `ObjectTemplateMeta` land both on the object and on its pods. Anything added to `k8s.v1.PodTemplateSpec` lands only on the pods.
