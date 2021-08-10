data "google_client_config" "default" {}

module "helm-gke-1" {
  source = "./modules/monitoring"

  providers = {
    helm = helm.gke-1
    # kubernetes = kubernetes.gke-1
  }

  namespace = "monitor"

  template     = true
  cluster_name = "var.cluster_name"
  value_file   = "./modules/monitoring/manifests/value-helm-prometheus.yaml"
  dashboard    = "./modules/monitoring/dashboards/cluster-dashboard.json"
  project_id   = "helm-test-sidecar"
}
