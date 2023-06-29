variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "cluster_name" {
  type = string
}

variable "network_id" {
  type = string
}

variable "disk" {
  type = object({ type_id = string, size = number })
  default = {
    type_id = "network-hdd"
    size    = 10
  }
}

variable "subnet" {
  type = list(object({ zone = string, id = string }))
}

variable "high_availability" {
  type    = bool
  default = false
}

variable "resource_preset_id" {
  type = string
  default = "b1.medium"
}

variable "environment" {
  type = string
  default = "PRESTABLE"
}
variable "mysql_version" {
  type = string
  default = "5.7"
}
