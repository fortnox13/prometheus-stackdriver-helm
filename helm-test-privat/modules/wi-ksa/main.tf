resource "kubernetes_namespace" "k8s_namespace" {

  metadata {
    labels = {
      cluster = var.cluster_name
    }

    name = var.namespace
  }
}

resource "kubernetes_service_account" "main" {

  metadata {
    name      = var.ksa
    namespace = var.namespace
  }
  depends_on = [resource.kubernetes_namespace.k8s_namespace]
}