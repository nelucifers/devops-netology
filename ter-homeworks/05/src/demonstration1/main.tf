terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.92.0"
    }
    template = {
      version = ">=2.2.0"
    }
  }
  required_version   = ">=0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket    = "tf-state-my"
    region    = "ru-central1"
    key       = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true

    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gu7l74om4kd99b6hhf/etn9546vklnkk0s670em"
    dynamodb_table    = "tflock-develop"
  }

}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}


#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop" {
  name           = "develop-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_security_group" "security_group" {
  name        = "Security group develop"
  description = "Description for security group develop"
  network_id  = yandex_vpc_network.develop.id
}

module "test-vm" {
  source             = "./yandex_compute_instance"
  env_name           = "develop"
  network_id         = yandex_vpc_network.develop.id
  subnet_zones       = ["ru-central1-a"]
  subnet_ids         = [ yandex_vpc_subnet.develop.id ]
  instance_name      = "web"
  instance_count     = 2
  image_family       = "ubuntu-2004-lts"
  security_group_ids = [yandex_vpc_security_group.security_group.id]

  metadata = {
      user-data   = data.template_file.cloudinit.rendered #Для демонстрации №3
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")
}