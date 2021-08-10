/*
  This module is intended to install Prometheus and Stackdriver sidecar components via helm charts
*/

resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "prometheus-community.github.io/helm-charts"
  chart            = "prometheus-community/kube-prometheus-stack"
  create_namespace = true
  namespace        = var.namespace

#   timeout = 600

  values = [
    # The file with all values that should override the default values for the chart:
    "${file("${var.value_file}")}"
  ]
}

resource "google_monitoring_dashboard" "infrastructure" {
project = var.project_id
dashboard_json = "${var.template}" ?  templatefile("${var.dashboard}", { cluster_name = var.cluster_name }) : file(var.dashboard)
}

