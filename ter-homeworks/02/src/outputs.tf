output "instance_external_ip" {
    value = {
      "${local.course}-${local.env}-${local.project}-web" = yandex_compute_instance.platform.network_interface.0.nat_ip_address,
      "${local.course}-${local.env}-${local.project}-db" = yandex_compute_instance.db.network_interface.0.nat_ip_address
    }
}
