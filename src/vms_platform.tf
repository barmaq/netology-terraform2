# удаляем дубликаты


#меняем переменные. и тут тоже удобнее было бы через list.

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_db_name" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.129.0.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db__image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image_family"
}

variable "vm_db_name" {
  type        = string
  default     = "db"
  description = "name for VM in YC"
}


variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform"
}

# variable "vm_db_cores" {
#   type        = number
#   default     = "2"
#   description = "cores"
# }

# variable "vm_db_memory" {
#   type        = number
#   default     = "2"
#   description = "memory"
# }

# variable "vm_db_core_fraction" {
#   type        = number
#   default     = "20"
#   description = "core_fraction"
# }

variable "vm_db_preemptible" {
  type        = bool
  default     = "true"
  description = "preemptible"
}

variable "vm_db_nat" {
  type        = bool
  default     = "true"
  description = ""
}

# variable "vm_db_sport_enable" {
#   type        = number
#   default     = "1"
#   description = "serial port enable"
# }

