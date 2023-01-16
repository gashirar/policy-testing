package k8sservicerequiredtype

test_service_type_is_cluster_ip {
    input := {
		"kind": "Service",
		"spec": {
			"type": "ClusterIP" 
		},
		"parameters": {
			"serviceType": "ClusterIP"
		}
	}
	count(violation) == 0 with input as input
}

test_service_type_is_not_set {
    input := {
		"kind": "Service",
		"spec": {
			"none": "none"
		},
		"parameters": {
			"serviceType": "ClusterIP"
		}
	}
	count(violation) == 0 with input as input
}

test_service_type_is_nodeport {
    input := {
		"kind": "Service",
		"spec": {
			"type": "NodePort" 
		},
		"parameters": {
			"serviceType": "ClusterIP"
		}
	}
	count(violation) == 1 with input as input
}

test_service_type_is_loadbalancer {
    input := {
		"kind": "Service",
		"spec": {
			"type": "LoadBalancer" 
		},
		"parameters": {
			"serviceType": "ClusterIP"
		}
	}
	count(violation) == 1 with input as input
}
