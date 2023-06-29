terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}

module "vpc_dev" {
  source       = "./vpc"
  env_name     = var.env_name
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24" },
  ]
  token        = var.token
  cloud_id     = var.cloud_id
  folder_id    = var.folder_id
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = var.env_name
  network_id      = module.vpc_dev.vpc_id
  subnet_zones    = [ var.default_zone ]
  subnet_ids      = [ module.vpc_dev.subnet_ids["${var.default_zone}"] ]
  instance_name   = var.instance_name
  instance_count  = var.instance_count
  image_family    = var.image_family
  public_ip       = var.public_ip
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")

  vars = {
    ssh_public_key = file(var.public_key)
  }
}

