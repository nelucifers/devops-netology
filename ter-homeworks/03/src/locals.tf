locals {
  metadata = {
    serial-port-enable = 1
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}
