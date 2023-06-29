output "vpc_id" {
  value = yandex_vpc_network.develop.id
}

output "subnet_ids" {
  value = { for k, v in yandex_vpc_subnet.develop : v.zone => v.id }
}

output "subnet" {
  value = [
    for k, v in yandex_vpc_subnet.develop : {
      zone = v.zone
      id   = v.id
    }
  ]
}
