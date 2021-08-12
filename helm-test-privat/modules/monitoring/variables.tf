variable "namespace" {
  type        = string
  default     = ""
  description = "namespaces for prometheus deploy"
}

variable "template_dashboard" {
  type        = bool
  default     = false
  description = "dashboards from template enabled"
}

variable "template_value" {
  type        = bool
  default     = false
  description = "value for helm chart from template enabled"
}

variable "dashboard"{
    type = string
    default = ""
    description = "path to JSON file which describe monitoring dashboard"
}

variable "value"{
    type = string
    default = ""
    description = "path to yaml file with values for prometheus helm chart"
}


variable "cluster_name" {
  type        = string
  default     = ""
  description = "cluster_name"
}

variable "cluster_region" {
  type        = string
  default     = ""
  description = "cluster region"
}

variable "project_id" {
  type        = string
  default     = ""
  description = "project ID"
}
