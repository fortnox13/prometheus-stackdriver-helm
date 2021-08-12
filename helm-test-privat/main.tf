data "google_client_config" "default" {}

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

}
