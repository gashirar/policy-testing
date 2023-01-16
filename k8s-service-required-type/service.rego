# METADATA
# title: Service Type Required
# description: >-
#  This policy allows you to require certain type are set on a Service.
# custom:
#   parameters:
#     serviceType:
#       type: string
#       description: String of required Service type.


package k8sservicerequiredtype

import data.lib.core

violation[{"msg": msg}] {
  core.has_field(core.resource.spec, "type")
  not core.resource.spec.type == input.parameters.serviceType
  msg := sprintf("you must set service type: %v", [input.parameters.serviceType])
}