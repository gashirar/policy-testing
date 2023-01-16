package deployment

test_deployment_pod_template_with_app_label {
    not deny_pod_app_label_is_not_set["Containers must provide app label for pod"] with input as {
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
	}
}

test_deployment_pod_template_without_app_label {
    deny_pod_app_label_is_not_set["Containers must provide app label for pod"] with input as {
		"kind": "Deployment",
		"spec": {
			"template": {
				"metadata": {
					"labels": {
						"version": "test-version",
					}
				},
			},
		},
	}
}

test_deployment_pod_template_with_version_label {
    deny_pod_version_label_is_not_set["Containers must provide version label for pod"] with input as {
		"kind": "Deployment",
		"spec": {
			"template": {
				"metadata": {
					"labels": {
						"app": "test-app",
					}
				},
			},
		},
	}
}

test_deployment_pod_template_without_version_label {
    deny_pod_version_label_is_not_set["Containers must provide version label for pod"] with input as {
		"kind": "Deployment",
		"spec": {
			"template": {
				"metadata": {
					"labels": {
						"none": "none",
					}
				},
			},
		},
	}
}
