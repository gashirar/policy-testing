package service

deny_service_type_is_not_cluster_ip[msg] {
  input.kind == "Service"
  not object.get(input.spec, "type", "N_DEFINED") == "N_DEFINED"
  not input.spec.type == "ClusterIP"

  msg := "Services must be ClusterIP"
}