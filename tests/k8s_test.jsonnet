// Regression tests. Each assert fails `kubecfg eval` when the behavior breaks.
local base = import '../k8s.libsonnet';
local k8s = base {
  ObjectMeta+: { namespace: 'ns' },
  v1+: { PodTemplateSpec+: { spec+: { nodeSelector: { os: 'linux' } } } },
};
local rbac = k8s['rbac.authorization.k8s.io'].v1;
local manifest(o) = std.parseJson(std.manifestJsonMinified(o));

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
  assert std.get(o.metadata, 'namespace') == (if t[3] then 'ns' else null) : o;
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
// default-container follows containers added after adopt.
assert !('annotations' in ap2.metadata) : ap2;
assert manifest(adoptedPod { spec+: { containers_+: { c+: { sidecar:: true }, new: { image: 'n' } } } })
       .metadata.annotations['kubectl.kubernetes.io/default-container'] == 'new';

local pod(spec) = { apiVersion: 'v1', kind: 'Pod', metadata: { name: 'p' }, spec: spec };
local adoptWith(types, spec, overlay={}) = manifest((base { v1+: types }).adopt([pod(spec)])[0] + overlay);

// overlays on the type reach adopted items: they merge with the upstream item and with later overlays.
local typeOverlays = adoptWith(
  {
    Container+: { imagePullPolicy: 'IfNotPresent', securityContext+: { runAsNonRoot: true } },
    PodSpec+: { containers_+: { c+: { imagePullPolicy: 'Always', env_+: { X: { value: 'x' } } } } },
  },
  { containers: [{ name: 'c', image: 'i', env: [{ name: 'A', value: 'a' }], securityContext: { readOnlyRootFilesystem: true } }] },
).spec.containers[0];
assert typeOverlays.env == [{ name: 'A', value: 'a' }, { name: 'X', value: 'x' }] : typeOverlays;
assert typeOverlays.imagePullPolicy == 'Always' : typeOverlays;
assert typeOverlays.securityContext == { readOnlyRootFilesystem: true, runAsNonRoot: true } : typeOverlays;

// fields and asserts of the item type see the final item, not the upstream one.
local live = adoptWith(
  { Container+: {
    imagePullPolicy: if std.endsWith(self.image, ':latest') then 'Always' else 'IfNotPresent',
    assert 'resources' in self : 'resources required',
  } },
  { containers: [{ name: 'c', image: 'x:1' }] },
  { spec+: { containers_+: { c+: { image: 'x:latest', resources: {} } } } },
).spec.containers[0];
assert live.imagePullPolicy == 'Always' : live;

// extending a type with more named arrays keeps the built-in ones adoptable.
local extended = adoptWith(
  { PodSpec+: base.typedNamedArrays(['imagePullSecrets']) },
  { containers: [{ name: 'c', image: 'i' }], imagePullSecrets: [{ name: 's' }] },
  { spec+: { containers_+: { c+: { image: 'patched' } }, imagePullSecrets_+: { t: {} } } },
).spec;
assert extended.containers[0].image == 'patched' : extended;
assert extended.imagePullSecrets == [{ name: 's' }, { name: 't' }] : extended;

// upstream order is kept; null arrays and unnamed, null-named or repeated items don't break adopt.
local odd = adoptWith({}, {
  initContainers: [{ name: 'wait', image: 'w' }, { name: 'migrate', image: 'm' }],
  volumes: null,
  containers: [{
    name: 'c',
    image: 'i',
    env: [{ name: 'POD_IP', value: 'ip' }, { name: 'JAVA_OPTS', value: '$(POD_IP)' }],
    ports: [{ containerPort: 80 }, { name: null, containerPort: 81 }, { name: 'http', containerPort: 82 }],
    volumeMounts: [{ name: 'cfg', mountPath: '/a', subPath: 'a' }, { name: 'cfg', mountPath: '/b', subPath: 'b' }],
  }],
}, { spec+: {
  volumes_+: { v: { emptyDir: {} } },
  containers_+: { c+: { ports_+: { http+: { containerPort: 8080 }, metrics: { containerPort: 9090 } } } },
} }).spec;
assert [c.name for c in odd.initContainers] == ['wait', 'migrate'] : odd;
assert [e.name for e in odd.containers[0].env] == ['POD_IP', 'JAVA_OPTS'] : odd;
assert odd.volumes == [{ name: 'v', emptyDir: {} }] : odd;
assert odd.containers[0].ports == [
  { containerPort: 80 },
  { name: null, containerPort: 81 },
  { name: 'http', containerPort: 8080 },
  { name: 'metrics', containerPort: 9090 },
] : odd;
assert std.length(odd.containers[0].volumeMounts) == 2 : odd;
local foo = { apiVersion: 'example.com/v1', kind: 'Foo', metadata: { name: 'f', namespace: 'other' }, spec: { items: [{ name: 'a' }] } };
assert manifest(k8s.adopt([foo]))[0] == foo;

'ok'
