data "google_client_config" "default" {}


# module "ksa" {
#   source = "./modules/wi-ksa"
#   providers = {
#     kubernetes = kubernetes.gke-1
#   }

#   namespace    = "prometheus"
#   cluster_name = var.cluster_name
#   ksa          = "prometheus"
#   gsa          = "prometheus-sa"
#   project_id   = var.project_id

# }
# resource "time_sleep" "wait" {
#   # We need to wait up to 10 minutes that all NEGs that were created in k8s module could be
#   # available for adding them to the backend service
#   create_duration = "30s"
#   depends_on     = [module.wi-google-sa]
# }

module "helm-gke-1" {
  source = "./modules/monitoring"

  providers = {
    helm = helm.gke-1
    # kubernetes = kubernetes.gke-1
  }

  template_dashboard = true
  template_value     = true

  namespace      = "prometheus"
  project_id     = var.project_id
  cluster_name   = var.cluster_name
  cluster_region = var.cluster_region
  value          = "./modules/monitoring/manifests/value-helm-prometheus.yaml"
  dashboard      = "./modules/monitoring/dashboards/cluster-dashboard.json"
depends_on     = [module.wi-google-sa]
#   depends_on     = [resource.time_sleep.wait]
}

module "wi-google-sa" {
  source = "./modules/wi-gsa"

  name         = "prometheus"
  cluster_name = var.cluster_name
  namespace    = "prometheus"
  project_id   = var.project_id
  roles = ["roles/monitoring.metricWriter"]
#   depends_on = [module.ksa]
}