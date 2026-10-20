+++
title = "KafkaTopic"
summary = "A Kafka topic managed by Strimzi"
aka = ["kafka.strimzi.io/v1 KafkaTopic"]
kind = "crd"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "v1beta2"
title = "kafka.strimzi.io/v1beta2 template"
status = "done"
note = "Only for Strimzi before 1.0, which removed v1beta2"

[[feature]]
id = "v1"
title = "kafka.strimzi.io/v1 template"
status = "done"
note = "The only version Strimzi 1.x serves"
+++

`apiVersion: kafka.strimzi.io/v1`, `kind: KafkaTopic`.

`spec.topicName` is required by the template.
