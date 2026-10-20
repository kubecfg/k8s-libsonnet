# Coverage map

This directory is a [todography](https://github.com/mkmik/todography) map of
which Kubernetes kinds have a template in `k8s.libsonnet`.

- Each directory is an *area*: one built-in API group, or one add-on project.
  Its `AREA.md` says which.
- Each other `.md` file is one kind. `status = "done"` means it has a
  template; a missing status means it doesn't yet; `dropped` means it is
  created by controllers or API calls, so a template would add little.
- Built-in kinds come from Kubernetes v1.37. Add-on areas cover the projects
  the library supports plus other widely used ones. Each lists the kinds in
  the project's CRDs, and its `AREA.md` names the release and CRD source they
  were checked against. Add-on APIs change
  versions on their own schedule, so re-check them when bumping.
- `lib/` holds the shared pieces the templates are built on.

```sh
todography lint        # check the map
todography next --all  # what to add next
todography open        # look at it in a browser
```

When you add a template to `k8s.libsonnet`, mark its kind as done here in the
same commit.
