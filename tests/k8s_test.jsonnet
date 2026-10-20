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

// every template has the right apiVersion and kind, typeFor finds it, and only namespaced kinds get the namespace.
local g(group) = k8s[group];
local templates = [
  // [template, apiVersion, kind, namespaced, required fields]
  [k8s.v1.Namespace, 'v1', 'Namespace', false, {}],
  [k8s.v1.ServiceAccount, 'v1', 'ServiceAccount', true, {}],
  [k8s.v1.Secret, 'v1', 'Secret', true, {}],
  [k8s.v1.ConfigMap, 'v1', 'ConfigMap', true, {}],
  [k8s.v1.Service, 'v1', 'Service', true, {}],
  [k8s.v1.Pod, 'v1', 'Pod', true, {}],
  [k8s.apps.v1.Deployment, 'apps/v1', 'Deployment', true, {}],
  [k8s.apps.v1.StatefulSet, 'apps/v1', 'StatefulSet', true, {}],
  [k8s.apps.v1.DaemonSet, 'apps/v1', 'DaemonSet', true, {}],
  [k8s.batch.v1.Job, 'batch/v1', 'Job', true, {}],
  [k8s.batch.v1.CronJob, 'batch/v1', 'CronJob', true, {}],
  [k8s.policy.v1.PodDisruptionBudget, 'policy/v1', 'PodDisruptionBudget', true, {}],
  [k8s.policy.v1beta1.PodDisruptionBudget, 'policy/v1beta1', 'PodDisruptionBudget', true, {}],
  [g('networking.k8s.io').v1.Ingress, 'networking.k8s.io/v1', 'Ingress', true, {}],
  [g('monitoring.coreos.com').v1.PodMonitor, 'monitoring.coreos.com/v1', 'PodMonitor', true, {}],
  [g('monitoring.coreos.com').v1.ServiceMonitor, 'monitoring.coreos.com/v1', 'ServiceMonitor', true, {}],
  [g('networking.istio.io').v1beta1.VirtualService, 'networking.istio.io/v1beta1', 'VirtualService', true, {}],
  [g('networking.istio.io').v1beta1.DestinationRule, 'networking.istio.io/v1beta1', 'DestinationRule', true, {}],
  [g('networking.istio.io').v1beta1.EnvoyFilter, 'networking.istio.io/v1beta1', 'EnvoyFilter', true, {}],
  [g('networking.istio.io').v1alpha3.EnvoyFilter, 'networking.istio.io/v1alpha3', 'EnvoyFilter', true, {}],
  [g('bitnami.com').v1alpha1.SealedSecret, 'bitnami.com/v1alpha1', 'SealedSecret', true, {}],
  [g('maupu.org').v1beta1.VaultSecret, 'maupu.org/v1beta1', 'VaultSecret', true, { spec+: { config+: { addr: 'a', auth+: { kubernetes+: { cluster: 'c' } } } } }],
  [g('kafka.strimzi.io').v1.KafkaTopic, 'kafka.strimzi.io/v1', 'KafkaTopic', true, { spec+: { topicName: 't' } }],
  [g('kafka.strimzi.io').v1beta2.KafkaTopic, 'kafka.strimzi.io/v1beta2', 'KafkaTopic', true, { spec+: { topicName: 't' } }],
  [rbac.Role, 'rbac.authorization.k8s.io/v1', 'Role', true, {}],
  [rbac.RoleBinding, 'rbac.authorization.k8s.io/v1', 'RoleBinding', true, { roleRef+: { name: 'r' } }],
  [rbac.ClusterRole, 'rbac.authorization.k8s.io/v1', 'ClusterRole', false, {}],
  [rbac.ClusterRoleBinding, 'rbac.authorization.k8s.io/v1', 'ClusterRoleBinding', false, { roleRef+: { name: 'r' } }],
  [g('apiextensions.k8s.io').v1.CustomResourceDefinition, 'apiextensions.k8s.io/v1', 'CustomResourceDefinition', false, {}],
  [g('cert-manager.io').v1.Certificate, 'cert-manager.io/v1', 'Certificate', true, {}],
  [g('route.openshift.io').v1.Route, 'route.openshift.io/v1', 'Route', true, {}],
];
local checkTemplate(t) =
  local o = manifest(t[0] + t[4] { metadata+: { name: 'x' } });
  local found = base.typeFor({ apiVersion: t[1], kind: t[2] });
  assert o.apiVersion == t[1] && o.kind == t[2] : o;
  assert (std.get(o.metadata, 'namespace') == 'ns') == t[3] : o;
  assert found.apiVersion == t[1] && found.kind == t[2] : t[1] + ' ' + t[2];
  true;
assert std.all(std.map(checkTemplate, templates));

// typeFor falls back to the plain Object for unknown kinds and groups.
local fallback(apiVersion) = manifest(k8s.typeFor({ apiVersion: apiVersion, kind: 'Foo' }) {
  apiVersion: apiVersion,
  kind: 'Foo',
  metadata+: { name: 'x' },
});
assert fallback('v1') == { apiVersion: 'v1', kind: 'Foo', metadata: { name: 'x', namespace: 'ns' } };
assert fallback('example.com/v1') == { apiVersion: 'example.com/v1', kind: 'Foo', metadata: { name: 'x', namespace: 'ns' } };

// Deployment, StatefulSet, DaemonSet and Job get PodTemplateSpec overlays.
local withPod = { spec+: { template+: { spec+: { containers_+: { c: { image: 'i' } } } } } };
local podOf(t) = manifest(t { metadata+: { name: 'x' } } + withPod).spec.template;
assert std.all([
  podOf(t).spec.nodeSelector.os == 'linux'
  for t in [k8s.apps.v1.Deployment, k8s.apps.v1.StatefulSet, k8s.apps.v1.DaemonSet, k8s.batch.v1.Job]
]);

// ObjectTemplateMeta labels land on the object and on its pods.
local labeled = manifest((base { ObjectTemplateMeta+: { labels+: { team: 't' } } }).apps.v1.Deployment {
  metadata+: { name: 'd' },
} + withPod);
assert labeled.metadata.labels.team == 't' && labeled.spec.template.metadata.labels.team == 't' : labeled;

// named arrays: foo_ objects become foo arrays keyed by name, items typed where the schema says so.
local pod2 = manifest(k8s.v1.Pod {
  metadata+: { name: 'p' },
  spec+: {
    initContainers_+: { init: { image: 'i' } },
    volumes_+: { data: { emptyDir: {} } },
    containers_+: {
      c: {
        image: 'i',
        env_+: { A: { value: 'a' } },
        ports_+: { http: { containerPort: 80 } },
        volumeMounts_+: { data: { mountPath: '/data' } },
      },
    },
  },
});
assert pod2.spec.initContainers == [{ name: 'init', image: 'i', env: [], ports: [], volumeMounts: [] }] : pod2;
assert pod2.spec.volumes == [{ name: 'data', emptyDir: {} }] : pod2;
assert pod2.spec.containers[0].env == [{ name: 'A', value: 'a' }] : pod2;
assert pod2.spec.containers[0].ports == [{ name: 'http', containerPort: 80 }] : pod2;
assert pod2.spec.containers[0].volumeMounts == [{ name: 'data', mountPath: '/data' }] : pod2;
local svc = manifest(k8s.v1.Service { metadata+: { name: 's' }, spec+: { ports_+: { http: { port: 80 } } } });
assert svc.spec.ports == [{ name: 'http', port: 80 }] : svc;

// default-container is set only when exactly one container is not a sidecar.
local annotationsOf(containers) = std.get(manifest(k8s.v1.Pod {
  metadata+: { name: 'p' },
  spec+: { containers_+: containers },
}).metadata, 'annotations', {});
assert annotationsOf({ main: {}, proxy: { sidecar:: true } })['kubectl.kubernetes.io/default-container'] == 'main';
assert annotationsOf({ a: {}, b: {} }) == {};
assert annotationsOf({}) == {};

// StatefulSet volumeClaimTemplates_ are keyed by metadata.name.
local sts = manifest(k8s.apps.v1.StatefulSet {
  metadata+: { name: 's' },
  spec+: { volumeClaimTemplates_+: { data: { spec: { accessModes: ['ReadWriteOnce'] } } } },
});
assert sts.spec.volumeClaimTemplates == [{ metadata: { name: 'data' }, spec: { accessModes: ['ReadWriteOnce'] } }] : sts;

// ServiceMonitor endpoints_ and PodMonitor podMetricsEndpoints_ are keyed by port, matchExpressions_ by key.
local mon = k8s['monitoring.coreos.com'].v1;
local sm = manifest(mon.ServiceMonitor {
  metadata+: { name: 'm' },
  spec+: {
    endpoints_+: { metrics: { interval: '30s' } },
    selector_+: { matchExpressions_+: { app: { operator: 'In', values: ['a'] } } },
  },
});
assert sm.spec.endpoints == [{ port: 'metrics', interval: '30s' }] : sm;
assert sm.spec.selector == { matchExpressions: [{ key: 'app', operator: 'In', values: ['a'] }] } : sm;
local pm = manifest(mon.PodMonitor {
  metadata+: { name: 'm' },
  spec+: { podMetricsEndpoints_+: { metrics: {} }, selector_+: { matchLabels: { app: 'a' } } },
});
assert pm.spec.podMetricsEndpoints == [{ port: 'metrics' }] : pm;
assert pm.spec.selector == { matchLabels: { app: 'a' } } : pm;

// VaultSecret secrets_ are keyed by path, and auth has defaults.
local vs = manifest(k8s['maupu.org'].v1beta1.VaultSecret {
  metadata+: { name: 'v' },
  spec+: {
    config+: { addr: 'a', auth+: { kubernetes+: { cluster: 'c' } } },
    secrets_+: { 'secret/foo': { kind: 'Generic' } },
  },
});
assert vs.spec.secrets == [{ path: 'secret/foo', kind: 'Generic' }] : vs;
assert vs.spec.config.auth.kubernetes == { cluster: 'c', role: 'docker-secrets', serviceAccount: 'default' } : vs;

// RBAC refs and defaults.
local rb = manifest(rbac.RoleBinding {
  metadata+: { name: 'rb' },
  roleRef+: { name: 'r' },
  subjects: [rbac.UserRef { name: 'u' }, rbac.GroupRef { name: 'g' }],
});
assert rb.roleRef == { apiGroup: 'rbac.authorization.k8s.io', kind: 'Role', name: 'r' } : rb;
assert rb.subjects == [
  { apiGroup: 'rbac.authorization.k8s.io', kind: 'User', name: 'u' },
  { apiGroup: 'rbac.authorization.k8s.io', kind: 'Group', name: 'g' },
] : rb;
assert manifest(rbac.ClusterRoleBinding { metadata+: { name: 'x' }, roleRef+: { name: 'r' } }).roleRef.kind == 'ClusterRole';
assert manifest(rbac.Role { metadata+: { name: 'x' } }).rules == [];

// generic helpers.
assert base.applyOverlayEach({ a: { x: 1 }, b:: { x: 2 } }, { y: 0 }) == { a: { x: 1, y: 0 } };
assert base.applyOverlayEach({ a: { x: 1 }, b:: { x: 2 } }, { y: 0 }).b == { x: 2, y: 0 };
assert base.deriveEach({ x: 0, y: 0 }, { a: { x: 1 } }) == { a: { x: 1, y: 0 } };
assert base.asKeyedArray('k', { a: { v: 1 }, b: { v: 2 } }) == [{ k: 'a', v: 1 }, { k: 'b', v: 2 }];
assert base.asNamedArray({ a: {} }) == [{ name: 'a' }];
assert base.orray({ rules: 'host' }) { rules_+: { 'a.com': { http: {} } } } == { rules: [{ host: 'a.com', http: {} }] };

// mounted components inherit the parent's k8s overlays and ambient config.
local child = base.Component {
  cm: $.k8s.v1.ConfigMap { metadata+: { name: 'c' }, data: { env: $.envConf.env, conf: $.conf.c } },
};
local app = base.Component {
  k8s+:: { ObjectMeta+: { namespace: 'app' } },
  envConf:: { env: 'prod' },
  conf:: { c: 'x' },
  components_:: { child: child },
};
assert manifest(app.components.child.cm) == {
  apiVersion: 'v1',
  kind: 'ConfigMap',
  metadata: { name: 'c', namespace: 'app' },
  data: { env: 'prod', conf: 'x' },
} : manifest(app);
assert manifest(base.RootComponent { cm: $.k8s.v1.ConfigMap { metadata+: { name: 'c' } } }).cm.kind == 'ConfigMap';

// adopt turns arrays into foo_ objects that overlays can reach, and keeps unknown kinds as they are.
local adoptedPod = k8s.adopt([{
  apiVersion: 'v1',
  kind: 'Pod',
  metadata: { name: 'p' },
  spec: {
    volumes: [{ name: 'v', emptyDir: {} }],
    containers: [{ name: 'c', image: 'i', env: [{ name: 'A', value: 'a' }] }],
  },
}])[0] {
  spec+: { containers_+: { c+: { env_+: { A+: { value: 'b' } } } }, volumes_+: { v+: { emptyDir: { medium: 'Memory' } } } },
};
local ap = manifest(adoptedPod);
assert ap.spec.containers[0].env == [{ name: 'A', value: 'b' }] : ap;
assert ap.spec.volumes == [{ name: 'v', emptyDir: { medium: 'Memory' } }] : ap;
assert ap.metadata.namespace == 'ns' : ap;
local ap2 = manifest(adoptedPod { spec+: { containers_+: { new: { image: 'n', env_+: { B: { value: 'b' } } } } } });
assert ap2.spec.containers[1].env == [{ name: 'B', value: 'b' }] : ap2;
local foo = { apiVersion: 'example.com/v1', kind: 'Foo', metadata: { name: 'f', namespace: 'other' }, spec: { items: [{ name: 'a' }] } };
assert manifest(k8s.adopt([foo]))[0] == foo;

'ok'
