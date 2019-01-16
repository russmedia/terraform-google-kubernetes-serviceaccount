variable "name" {
  description = "name of the serviceaccount"
}

variable "name-prefix" {
  description = "prefix to add to secret name (i.e. to mark resources created by terraform)"
  default     = ""
}

variable "project" {
  description = "cloud services project name"
}

variable "role" {
  description = "role names found at https://cloud.google.com/compute/docs/access/iam"
}

variable "environment" {
  description = "environment name to use to avoid naming conflicts"
}

variable "namespace" {
  description = "kubernetes namespace to install secrets in"
}
