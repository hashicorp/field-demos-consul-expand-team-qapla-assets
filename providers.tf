# Data resources to check GKE cluster endpoints and certs would be ideal, but there are some issues regarding
# dependencies with Providers and data refresh for Kubernetes and Helm providers, so we will be using some outputs
# from dependent modules

# data "google_container_cluster" "primary_gke" {
#   depends_on = [ module.gke ]
#   name = module.gke[0].cluster_name
#   # name = "${var.gke_cluster}1"
#   location = var.gcp_zone[0]
# }

# data "google_container_cluster" "secondary_gke" {
#   count = var.create_federation ? 1 : 0
#   depends_on = [ module.gke ]
#   # name = module.gke.1.cluster_name
#   name = "${var.gke_cluster}2"
#   location = var.gcp_zone[1]
# }


locals {
  # primary_host = "https://${data.google_container_cluster.primary_gke.endpoint}"
  # primary_cert = base64decode(data.google_container_cluster.primary_gke.master_auth.0.cluster_ca_certificate)
  # secondary_host = var.create_federation ? "https://${data.google_container_cluster.secondary_gke.0.endpoint}" : ""
  # secondary_cert = var.create_federation ? base64decode(data.google_container_cluster.secondary_gke.0.master_auth.0.cluster_ca_certificate) : ""
  primary_host = "https://${module.gke[0].k8s_endpoint}"
  primary_cert = module.gke[0].gke_ca_certificate
  secondary_host = var.create_federation ? "https://${module.gke[1].k8s_endpoint}" : ""
  secondary_cert = var.create_federation ? module.gke[1].gke_ca_certificate : ""
}

provider "google" {
  project = var.gcp_project
  # region = var.gcp_region
}
provider "helm" {
  alias = "primary"
  kubernetes {
    # load_config_file = false
    token = data.google_client_config.current.access_token
    host = local.primary_host
    cluster_ca_certificate = local.primary_cert
  }
}
provider "kubernetes" {
  alias = "primary"
  # load_config_file = false
  token = data.google_client_config.current.access_token
  host = local.primary_host
  # cluster_ca_certificate = local.primary_cert
  cluster_ca_certificate = local.primary_cert
}

provider "helm" {
  alias = "secondary"
  kubernetes {
    # load_config_file = false
    token = data.google_client_config.current.access_token
    host = local.secondary_host
    cluster_ca_certificate = local.secondary_cert
  }
}
provider "kubernetes" {
  alias = "secondary"
  # load_config_file = false
  token = data.google_client_config.current.access_token
  host = local.secondary_host
  cluster_ca_certificate = local.secondary_cert
} 


