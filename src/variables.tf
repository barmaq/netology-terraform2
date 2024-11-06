###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "b1g2678hn0b6tk45jj76"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "b1gg0512n1fejb81t8f8"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.128.0.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4DFQBsJA/Djtas+6WVht6qyVPLgia0JVBjEmNrnmdL barmaq for yacloud"
  description = "ssh-keygen -t ed25519"
}

variable "vms_ssh_public_root_key" {
  type        = string
  default     = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyMJezE+Yc+NjyJOkIi+a\nrjxm6+CSbry6Sb2zHiDNhAALX663UDuH1qVKiivvSDvalfn0yr2PZ7/YUkAI/14l\nJ0hC6ZaVulSX5dcU3l97e98BR6vzdT5w14JJwtnRDIwMzcVBytC8sxylqzHvHgLO\nMQsaXYMlxmuCoXNgANAYkwPb3lnE/JWMu+y44HBqUoP700oSxWjJKHWpiHM3nvFn\n1bofJYTyaZCbaWqgaxeITjHXIrspwOl9Bm27p89VbBKcYa6J96mB4T2mEGgSrARy\nBCLG4cpPUGgVLZ3qleRjrtaM62KiJmyuZFKQEqbUAxFvg/o1+y4IYVs7ewyrBLDo\nEwIDAQAB\n-----END PUBLIC KEY-----\n"
  description = "ssh-key RSA_2048"
}

#добавляем переменные

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image_family"
}

variable "vm_web_name" {
  type        = string
  default     = "platform-web"
  description = "name for VM in YC"
}


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform"
}

# variable "vm_web_cores" {
#   type        = number
#   default     = "2"
#   description = "cores"
# }

# variable "vm_web_memory" {
#   type        = number
#   default     = "1"
#   description = "memory"
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   default     = "20"
#   description = "core_fraction"
# }

variable "vm_web_preemptible" {
  type        = bool
  default     = "true"
  description = "preemptible"
}

variable "vm_web_nat" {
  type        = bool
  default     = "true"
  description = ""
}

variable "vm_web_sport_enable" {
  type        = number
  default     = "1"
  description = "serial port enable"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
	  core_fraction = number
  }))
  default = {
    "web" = {
		cores         = 2
		memory        = 1
		core_fraction = 20
    },
    "db" = {
		cores         = 2
		memory        = 2
		core_fraction = 20
    }
  }
}

variable "metadata" {
  type = map(object({
    serial-port-enable         = number
    ssh-keys                   = string
  }))
  default = {
    "standart" = {
		serial-port-enable         = 1
		ssh-keys                   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4DFQBsJA/Djtas+6WVht6qyVPLgia0JVBjEmNrnmdL barmaq for yacloud"
    }
  }
}