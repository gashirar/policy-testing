# METADATA
# title: Deployment PodTemplate Required Labels
# description: >-
#  This policy allows you to require certain labels are set on a PodTemplate.
# custom:
#   parameters:
#     labels:
#       type: array
#       description: Array of required label keys.
#       items:
#         type: string

package k8sdeploymentpodtemplaterequiredlabels

import data.lib.core

violation[{"msg": msg}] {
  provided := {label | core.resource.spec.template.metadata.labels[label]}
  required := {label | label := input.parameters.labels[_]}
  missing := required - provided
  count(missing) > 0
  msg := sprintf("you must provide labels: %v", [missing])
}

