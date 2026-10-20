+++
title = "adopt"
summary = "Turns plain objects, such as parsed YAML, into objects you can override like templates"
kind = "lib"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "typed"
title = "Looks up the template for each object's apiVersion and kind"
status = "done"

[[feature]]
id = "dotted-groups"
title = "Finds templates for groups with dots, such as networking.k8s.io"
status = "done"

[[feature]]
id = "named-arrays"
title = "Turns arrays back into foo_ objects keyed by name"
status = "done"
needs = ["/lib/named-arrays"]

[[feature]]
id = "unnamed-items"
title = "Leaves arrays alone when their items have no name"
status = "done"
+++

Objects of a kind without a template fall back to the plain `k8s.Object`. They still work, but get none of the helpers, and cluster-wide ones get the shared namespace (see t8y:/lib/cluster-scoped).
