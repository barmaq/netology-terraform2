###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "***"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "***"
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
  default     = "****"
  description = "ssh-keygen -t ed25519"
}

variable "vms_ssh_public_root_key" {
  type        = string
  default     = "***"
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
		ssh-keys                   = "***"
    }
  }
}
