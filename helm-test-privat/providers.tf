provider "google" {}



provider "helm" {
  alias = "gke-1"
  kubernetes {
    host                   = "https://35.224.9.6"
    cluster_ca_certificate = file("./gke.cert")
    config_path            = "~/.kube/config"
    token                  = data.google_client_config.default.access_token
  }
}

# provider "kubernetes" {
#   alias                  = "gke-1"
#   host                   = "https://35.223.105.173"
#   cluster_ca_certificate = base64decode("./gke.cert")
#   token                  = data.google_client_config.default.access_token
# }