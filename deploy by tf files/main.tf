/*
  This module is intended to install Prometheus components via helm charts
*/

resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "prometheus-community.github.io/helm-charts"
  chart            = "prometheus-community/kube-prometheus-stack"
  create_namespace = true
  namespace        = "prometheus"

#   timeout = 600

  values = [
    # The file with all values that should override the default values for the chart:
    "${file("manifests/value-helm-prometheus.yaml")}"
  ]
}

