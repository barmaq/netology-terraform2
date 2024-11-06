output "info" {
  value = {
    platform = {
      instance_name = yandex_compute_instance.platform.name
      fqdn          = yandex_compute_instance.platform.fqdn
      nat_ip        = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    }
    db = {
      instance_name = yandex_compute_instance.db.name
      fqdn          = yandex_compute_instance.db.fqdn
      nat_ip        = yandex_compute_instance.db.network_interface.0.nat_ip_address
    }
  }
  description = "instance_name, fqdn и nat_ip_address для каждого экземпляра"
}