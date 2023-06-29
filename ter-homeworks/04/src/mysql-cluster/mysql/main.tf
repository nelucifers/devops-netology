terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}


resource "yandex_mdb_mysql_cluster" "cluster" {
  name        = "${var.cluster_name}"
  environment = "${var.environment}"
  version     = "${var.mysql_version}"
  network_id  = "${var.network_id}"

  resources {
    resource_preset_id = "${var.resource_preset_id}"
    disk_type_id       = "${var.disk.type_id}"
    disk_size          = "${var.disk.size}"
  }

  dynamic "host" {  
    for_each = var.high_availability ? [1, 2] : [1]
    content {
      name      = "host-${host.value}"
      zone      = "${var.subnet[host.key].zone}"
      subnet_id = "${var.subnet[host.key].id}"
    }
  }

}
