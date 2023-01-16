package k8sdeploymentpodtemplaterequiredlabels

test_deployment_pod_template_with_app_label {
    input := {
		"kind": "Deployment",
		"spec": {
			"template": {
				"metadata": {
					"labels": {
						"app": "test-app",
						"version": "test-version"
					}
				},
			},
		},
		"parameters": {
			"labels": ["app", "version"]
		}
	}
	count(violation) == 0 with input as input
}

test_deployment_pod_template_without_app_label {
    input := {
		"kind": "Deployment",
		"spec": {
			"template": {
				"metadata": {
					"labels": {
						"version": "test-version"
					}
				},
			},
		},
		"parameters": {
			"labels": ["app", "version"]
		}
	}
	count(violation) == 1 with input as input
}

test_deployment_pod_template_with_version_label {
    input := {
		"kind": "Deployment",
		"spec": {
			"template": {
				"metadata": {
					"labels": {
						"version": "test-version"
					}
				},
			},
		},
		"parameters": {
			"labels": ["app", "version"]
		}
	}
	count(violation) == 1 with input as input
}

test_deployment_pod_template_without_version_label {
    input := {
		"kind": "Deployment",
		"spec": {
			"template": {
				"metadata": {
					"labels": {
						"other": "other-app"
					}
				},
			},
		},
		"parameters": {
			"labels": ["app", "version"]
		}
	}
	count(violation) == 1 with input as input
}