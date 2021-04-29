# variable "username" {
#   description = "The Kubernetes username"
#   default = "admin"
# }
# variable "password" {
#   description = "A password to be generated during provisioning"
# }
# variable "token" {
#   description = "The Kubernetes client token"
# }
# variable "k8s_host" {
#   description = "The Kubernetes host endpoint"
# }
# variable "k8s_cert" {
#   description = "The Kubernetes certificate"
# }


variable "cluster_namespace" {
  description = "Namespace to be created for the cluster"
}
variable "cluster_endpoint" {
  description = "Endpoint host of the K8s cluster"
}
variable "cluster_name" {
  description = "Name of the K8s cluster"
}
variable "location" {
  description = "Location of K8s cluster"
}
variable "gcp_project" {
  description = "Cloud GCP project"
}
variable "gcp_region" {
  description = "Cloud GCP project"
}


variable "values_file" {
  description = "Values YAML file in templates folder"
  default = "consul-values-dc.yaml"
}
variable "federated" {
  description = "To select if this cluster is a federated one"
  default = false
}
variable "federation_secret" {
  description = "Federation secret data to create. This is a map of values"
  default = null
}
variable "ca_certificate" {
  description = "The K8s ca cert"
}
# variable "client_key" {
#   description = "The Kubernetes client key"
# }
# variable "hostname" {
#   description = "The DNS hostname for Vault"
#   default = ""
# }
variable "config_bucket" {
  description = "Cloud bucket to save config generated files"
}
variable "consul_repo" {
  description = "Vault Helm repositorie to use"
  default = "hashicorp/consul"
}
variable "nodes" {
  description = "Number of nodes/pods of the cluster"
}
variable "gcp_service_account" {
  description = "SA to create credentials for KMS auto-unseal"
}
# variable "tls" {
#   description = "Enabling/Disabling HTTPS"
# }
variable "dns_zone" {
  description = "Cloud DNS zone to create record"
  default = null
}
variable "consul_license" {
  description = "License for Consul Enterprise"
  default = null
}
variable "consul_dc" {
  description = "Datacenter name for Consul servers"
  default = "dc1"
}
variable "enterprise" {
  description = "Usin Enterprise version if true"
  default = false
}
variable "consul_version" {
  description = "Consul version"
  default = "1.8.4"
}
# variable "envoy_version" {
#   description = "Envoy proxy version. Check supported matrix: https://www.consul.io/docs/connect/proxies/envoy#supported-versions"
#   default = "v1.14-latest"
# }
variable "chart_version" {
  description = "Consul Helm Chart version: https://www.consul.io/docs/k8s/upgrade/compatibility#supported-consul-versions"
  default = "0.26.0"
}
