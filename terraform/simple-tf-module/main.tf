terraform {
  required_version = ">= 0.13"
//  backend "local" {
//    path    = "mybackend/terraform.tfstate"
//  }
}
// test
// vido was here

resource "null_resource" "task_log" {
  provisioner "local-exec" {
    command = "echo task_log. variables: rabbit_endpoint=bla."
  }
}

resource "null_resource" "task_long" {
  provisioner "local-exec" {
    command = "echo \"some task\""
  }
}

locals {
  key1 = "somekey"
}
