
    variable "compartment_ocid" {}
    variable "tenancy_ocid" {}
    variable "region" {}

    variable "vcn_display_name" {
      default = "Yakir-vcn"
    }
    
    variable "vcn_cidr" {
      default = "192.170.64.0/20"
    }

    variable "vcn_dns_label" {
      default     = "Terra"
    }
# SUBNET INFO
    variable "subnet_dns_label" {
      default = "terra"
    }
    variable "subnet_display_name"{
      default = "terrasub" 
      }

    variable "subnet_cidr"{
      default = "192.170.78.0/24"
      }  
    
  