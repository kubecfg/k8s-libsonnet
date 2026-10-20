+++
title = "OpenShift routes"
band = "addons"
summary = "route.openshift.io: OpenShift HTTP routing"
+++

Templates live in `k8s.libsonnet` under `k8s['route.openshift.io'].v1`.

Checked against route/v1 in https://github.com/openshift/api. Only route.openshift.io is mapped; the rest of OpenShift's APIs are out of scope.
