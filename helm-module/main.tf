data "google_client_config" "default" {}

module "helm-gke-1" {
  source = "./modules/monitoring"

  providers = {
    helm = helm.gke-1
    # kubernetes = kubernetes.gke-1
  }

  namespace = "monitor"

}