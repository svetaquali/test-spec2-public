terraform {
  required_version = ">= 0.13"
//  backend "local" {
//    path    = "mybackend/terraform.tfstate"
//  }
}


module "sub_module" {
  source = "../sub-module"
  test_input1 = "value-from-main-module"
}

resource "null_resource" "my-script-new2" {
  provisioner "local-exec" {
    command = "echo Hello-From-module"
  }
}



resource "time_static" "example" {}

resource "null_resource" "task_log" {
  provisioner "local-exec" {
    command = "echo task_log. variables: rabbit_endpoint=bla."
  }
}


locals {
  key1 = "somekey"
}

#shirel was here
