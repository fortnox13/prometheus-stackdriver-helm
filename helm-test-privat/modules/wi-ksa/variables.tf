variable "namespace" {
  description = "Namespace for k8s service account"
  default     = "default"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name. Required if using existing KSA."
  type        = string
  default     = ""
}
variable "ksa" {
  description = "Cluster name. Required if using existing KSA."
  type        = string
  default     = ""
}
variable "gsa" {
  description = "Cluster name. Required if using existing KSA."
  type        = string
  default     = ""
}
variable "project_id" {
  description = "GCP project ID"
  type        = string
}