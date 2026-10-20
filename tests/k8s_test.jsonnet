// Regression tests. Each assert fails `kubecfg eval` when the behavior breaks.
local base = import '../k8s.libsonnet';
local k8s = base {
  ObjectMeta+: { namespace: 'ns' },
  v1+: { PodTemplateSpec+: { spec+: { nodeSelector: { os: 'linux' } } } },
};
local rbac = k8s['rbac.authorization.k8s.io'].v1;
local manifest(o) = std.parseJson(std.manifestJsonMinified(o));

// typeFor resolves core, simple and dotted groups.
local kindOf(apiVersion, kind) = base.typeFor({ apiVersion: apiVersion, kind: kind }).kind;
assert kindOf('v1', 'Service') == 'Service';
assert kindOf('apps/v1', 'Deployment') == 'Deployment';
assert kindOf('networking.k8s.io/v1', 'Ingress') == 'Ingress';

// cluster-scoped objects don't inherit the ambient namespace.
local nsOf(t) = std.get(manifest(t { metadata+: { name: 'x' } }).metadata, 'namespace');
assert nsOf(k8s.v1.ConfigMap) == 'ns';
assert nsOf(k8s.v1.Namespace) == null;
assert nsOf(rbac.ClusterRole) == null;
assert nsOf(rbac.ClusterRoleBinding { roleRef+: { name: 'r' } }) == null;
assert nsOf(k8s['apiextensions.k8s.io'].v1.CustomResourceDefinition) == null;

// ServiceAccountRef picks up the ambient namespace.
assert manifest(rbac.ServiceAccountRef { name: 'sa' }).namespace == 'ns';

// Pod and CronJob get PodTemplateSpec overlays.
local pod = manifest(k8s.v1.Pod { metadata+: { name: 'p' }, spec+: { containers_+: { c: { image: 'i' } } } });
assert pod.spec.nodeSelector.os == 'linux' : pod;
assert pod.metadata.annotations['kubectl.kubernetes.io/default-container'] == 'c';
local cron = manifest(k8s.batch.v1.CronJob {
  metadata+: { name: 'cj' },
  spec+: { schedule: '@daily', jobTemplate+: { spec+: { template+: { spec+: { containers_+: { c: { image: 'i' } } } } } } },
});
assert cron.spec.jobTemplate.spec.template.spec.nodeSelector.os == 'linux' : cron;

// add-on kinds use the apiVersion their projects serve today.
local apiOf(t) = manifest(t { metadata+: { name: 'x' } }).apiVersion;
assert apiOf(k8s['kafka.strimzi.io'].v1.KafkaTopic { spec+: { topicName: 't' } }) == 'kafka.strimzi.io/v1';
assert apiOf(k8s['networking.istio.io'].v1alpha3.EnvoyFilter) == 'networking.istio.io/v1alpha3';
assert kindOf('kafka.strimzi.io/v1', 'KafkaTopic') == 'KafkaTopic';
assert kindOf('networking.istio.io/v1alpha3', 'EnvoyFilter') == 'EnvoyFilter';

// adopt keeps arrays whose elements have no name instead of crashing.
local adopted = manifest(k8s.adopt([{
  apiVersion: 'apps/v1',
  kind: 'Deployment',
  metadata: { name: 'd' },
  spec: { template: { spec: { containers: [{ name: 'c', image: 'i', ports: [{ containerPort: 80 }] }] } } },
}]))[0];
assert adopted.spec.template.spec.containers[0].ports == [{ containerPort: 80 }] : adopted;

'ok'
