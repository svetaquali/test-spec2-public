provider "vsphere" {
  user           = var.private_cloud_login
  password       = var.private_cloud_password
  vsphere_server = var.private_cloud_host
  version        = "=1.15.0"
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}

data "vsphere_custom_attribute" "attribute" {
  depends_on = [
    vsphere_custom_attribute.attribute
  ]
  name = "terraform-test-attribute"
}

resource "vsphere_custom_attribute" "attribute" {
  name                = "terraform-test-attribute"
  managed_object_type = "Folder"
}

resource "vsphere_folder" "folder" {
  path          = "alexander.g/terraform-test-folder"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
  custom_attributes = tomap({"${data.vsphere_custom_attribute.attribute.id}" = "John Doe"})
}

