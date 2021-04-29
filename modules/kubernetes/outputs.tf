output "consul_yaml" {
  value = "https://storage.cloud.google.com/${google_storage_bucket_object.consul-config.bucket}/${google_storage_bucket_object.consul-config.output_name}"
}
output "federation_secret" {
  value = data.kubernetes_secret.consul-federation.data
  sensitive = true
}
# output "consul_ui" {
#   value = data.kubernetes_service.consul-ui.status.0.load_balancer.0.ingress.0.ip
# }
