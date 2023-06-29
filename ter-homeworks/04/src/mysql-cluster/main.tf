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
  env_name     = var.vpc_name
  subnets = [ 
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" }
  ]
  token        = var.token
  cloud_id     = var.cloud_id
  folder_id    = var.folder_id
}


module "mysql_cluster" {
  source            = "./mysql"
  cluster_name      = "${var.cluster_name}"
  high_availability = "${var.high_availability}"
  network_id        = module.vpc_dev.vpc_id
  subnet            = module.vpc_dev.subnet
  token             = var.token
  cloud_id          = var.cloud_id
  folder_id         = var.folder_id
}

module "mysql_db" {
  source       = "./mysql_db"
  cluster_id   = module.mysql_cluster.cluster_id
  db_name      = "${var.db_name}"
  username     = "${var.username}"
  password     = "${var.password}"
  token        = var.token
  cloud_id     = var.cloud_id
  folder_id    = var.folder_id
}
