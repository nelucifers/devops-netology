###cloud vars
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

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "public_key" {
  type    = string
  default = ""
}

### Задание №4
variable "ip_address" {
  type        = string
  description = "ip-адрес"
  default     = "192.168.0.1"
  validation {
    condition     = (cidrhost("192.168.0.0/24", 1) == var.ip_address)
    error_message = "Invalid IP-address"
  }
}

variable "ip_address_list" {
  type        = list(string)
  description = "список ip-адресов"
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  validation {
    condition     = alltrue([
      for ip in var.ip_address_list : 
      can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", ip))
    ])
    error_message = "Invalid IP-addresses list"
  }
}


### Задание №5
variable "str" {
  type        = string
  default     = "test-string"

  validation {
      condition = var.str == lower(var.str)
      error_message = "String contains uppercase characters"
  }
}

variable "in_the_end_there_can_be_only_one" {
  description="Who is better Connor or Duncan?"
  type = object({
      Dunkan = optional(bool)
      Connor = optional(bool)
  })

  default = {
      Dunkan = true
      Connor = false
  }

  validation {
      error_message = "There can be only one MacLeod"
      condition = var.in_the_end_there_can_be_only_one.Dunkan != var.in_the_end_there_can_be_only_one.Connor
  }
}