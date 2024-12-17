variable "service_account_key_file" {
  description = "Path to the GCP service account key file"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"  # Default region
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"  # Default zone
}

variable "vm_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "example-vm"  # Default VM name
}

variable "machine_type" {
  description = "Machine type for the VM instance"
  type        = string
  default     = "e2-micro"  # Default machine type (smallest and most cost-effective)
}

variable "image" {
  description = "Disk image for the VM instance"
  type        = string
  default     = "debian-cloud/debian-11"  # Default to Debian 11
}