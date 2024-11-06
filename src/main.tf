resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

# resource "yandex_vpc_network" "db" {
#   name = var.vpc_name
# }
resource "yandex_vpc_subnet" "db" {
  name           = var.vpc_db_name
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}
resource "yandex_compute_instance" "platform" {
#  name        = var.vm_web_name
  name        = local.platform_name
  hostname    = var.vpc_name
  zone        = var.default_zone
  platform_id = var.vm_web_platform_id
  resources {
    # cores         = var.vm_web_cores
    # memory        = var.vm_web_memory
    # core_fraction = var.vm_web_core_fraction
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat
  }

  metadata = {
#    serial-port-enable = var.vm_web_sport_enable
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
    serial-port-enable = var.metadata.standart.serial-port-enable
    ssh-keys           = "ubuntu:${var.metadata.standart.ssh-keys}"
  }

}

resource "yandex_compute_instance" "db" {
#  name        = var.vm_db_name
  name        = local.db_name
  hostname    = var.vpc_db_name
  zone        = var.vm_db_zone
  platform_id = var.vm_db_platform_id
  resources {
    # cores         = var.vm_db_cores
    # memory        = var.vm_db_memory
    # core_fraction = var.vm_db_core_fraction
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = var.vm_db_nat
  }

  metadata = {
    # serial-port-enable = var.vm_db_sport_enable
    # ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
    serial-port-enable = var.metadata.standart.serial-port-enable
    ssh-keys           = "ubuntu:${var.metadata.standart.ssh-keys}"
  }

}