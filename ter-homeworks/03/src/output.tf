locals {
  vms = concat([for k,v in yandex_compute_instance.vms : v], yandex_compute_instance.web, [yandex_compute_instance.storage])
}

output "instance_dict" {
  value = [
    for k, v in local.vms : {
      "name" = v.name
      "id" = v.id
      "fqdn" = v.fqdn
    }
  ]
}
