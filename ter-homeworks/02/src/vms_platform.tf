variable "vms_resources" {
  type = map(map(any))
  default = {
    web = {
      cores = 2
      memory = 1
      core_fraction = 5
    }
    db = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}

variable "metadata" {
  type = map
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO1aQXyxjFAOssTLu4uBa4MA4isPaONXVGuMfmJ647+W user@server-ubuntu2204"
  }
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
}

variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
}

