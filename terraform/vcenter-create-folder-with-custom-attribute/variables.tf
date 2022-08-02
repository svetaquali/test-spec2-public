variable "private_cloud_login" {
  type = string
  sensitive = true
}

variable "private_cloud_password" {
  type = string
  sensitive = true
}

variable "private_cloud_host" {
  type = string
  sensitive = true
}

variable "datacenter_name" {
  type = string
  default = "Sandbox vCenter"
}
