//terraform {
//  required_version = ">= 0.13"
////  backend "local" {
////    path    = "mybackend/terraform.tfstate"
////  }
//}

resource "null_resource" "my-script-new2" {
  provisioner "local-exec" {
    command = "echo Hello-From-Sub-Module"
  }
}



resource "time_static" "example" {}


locals {
  key1 = "sub-module-somekey"
}

