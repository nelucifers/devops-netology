resource "yandex_compute_disk" "disks" {
  count = 3

  name = "disk-${count.index + 1}"
  size = 1
}

resource "yandex_compute_instance" "storage" {
  name = "storage"

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  dynamic secondary_disk {
    for_each = yandex_compute_disk.disks
    content {
      disk_id = secondary_disk.value.id
    }
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = local.metadata.serial-port-enable
    ssh-keys           = local.metadata.ssh-keys
  }

  scheduling_policy {
    preemptible = true
  }

}
