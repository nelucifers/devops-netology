resource "yandex_compute_instance" "vms" {
  
  depends_on = [yandex_compute_instance.web]

  for_each = {
    for index, vm in var.vms:
    vm.vm_name => vm
  }

  name = "${each.value.vm_name}"
  
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
#    nat                = true
  }

  metadata = {
    serial-port-enable = local.metadata.serial-port-enable
    ssh-keys           = local.metadata.ssh-keys
  }

  scheduling_policy {
    preemptible = true
  }
}
