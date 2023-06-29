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

variable "cluster_id" {
  type = string
}

variable "db_name" {
  type = string
  default = "testdb"
}

variable "username" {
  type = string
  default = "admin"
}

variable "password" {
  type = string
  default = "pa$$w0rd"
}
