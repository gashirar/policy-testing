package service

test_service_type_is_cluster_ip {
    not deny_service_type_is_not_cluster_ip["Services must be ClusterIP"] with input as {
		"kind": "Service",
		"spec": {
			"type": "ClusterIP" 
		},
	}
}

test_service_type_is_not_set {
    not deny_service_type_is_not_cluster_ip["Services must be ClusterIP"] with input as {
		"kind": "Service",
	}
}

test_service_type_is_nodeport {
    deny_service_type_is_not_cluster_ip["Services must be ClusterIP"] with input as {
		"kind": "Service",
 		"spec": {
			"type": "NodePort" 
		},
	}
}

test_service_type_is_loadbalancer {
    deny_service_type_is_not_cluster_ip["Services must be ClusterIP"] with input as {
		"kind": "Service",
 		"spec": {
			"type": "LoadBalancer" 
		},
	}
}
