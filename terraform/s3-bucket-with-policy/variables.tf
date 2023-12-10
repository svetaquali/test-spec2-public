variable "name" {
    description = "Name of S3 bucket"
    type = string
}

variable "region" {
    description = "Region where to create resources" 
    type = string
    default = "eu-west-1"
}
