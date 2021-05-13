resource "helm_release" "consul" {
  depends_on = [
      # kubernetes_secret.google-application-credentials,
      kubernetes_namespace.consul
  ]
  name = "consul"
  # Depending on deprecation of data.helm_repository
  # repository = "${data.helm_repository.vault.metadata[0].name}"
  repository = "https://helm.releases.hashicorp.com"
  chart  = "consul"
  create_namespace = false
  namespace = kubernetes_namespace.consul.metadata.0.name
  force_update = false
  version = var.chart_version
  values = [
      google_storage_bucket_object.consul-config.content
  ]

  wait = false
}

data "kubernetes_secret" "consul-federation" {
  depends_on = [ helm_release.consul ]
  metadata {
    name = "consul-federation"
    namespace = kubernetes_namespace.consul.metadata.0.name
  }
}


# # Let's create a sleep to let the Load Balancer IP be assigned. We could enable `wait` in the Helm also, but we want to depend only on LB for Consul-UI
# resource "time_sleep" "wait_60_seconds" {
#   depends_on = [
#     helm_release.consul
#   ]

#   create_duration = "1s"
# }

# # Let's enable this if you want to expose in the output the Consul-UI.
# data "kubernetes_service" "consul-ui" {
#   depends_on = [ 
#     helm_release.consul,
#     time_sleep.wait_60_seconds
#   ]
#   metadata {
#     name = "consul-ui"
#     namespace = kubernetes_namespace.consul.metadata.0.name
#   }
# }

