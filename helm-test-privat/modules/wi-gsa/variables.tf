variable "name" {
  description = "Name for both service accounts. The GCP SA will be truncated to the first 30 chars if necessary."
  type        = string
}

variable "cluster_name" {
  description = "Cluster name. Required if using existing KSA."
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Namespace for k8s service account"
  default     = "default"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}


variable "roles" {
  type        = list(string)
  default     = []
  description = "(optional) A list of roles to be added to the created Service account"
}
