package deployment

deny_pod_app_label_is_not_set[msg] {
  input.kind == "Deployment"
  not input.spec.template.metadata.labels.app

  msg := "Containers must provide app label for pod"
}

deny_pod_version_label_is_not_set[msg] {
  input.kind == "Deployment"
  not input.spec.template.metadata.labels.version

  msg := "Containers must provide version label for pod"
}
