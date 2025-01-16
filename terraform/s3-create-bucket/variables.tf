variable "name" {
    description = "Name of S3 bucket"
    type = string
    nullable = false
    default = "default-tf-bucket-name1111"
}

variable "test_input" {
    description = "Mandatory input"
    type = string
    # nullable = false
    # default = "default-tf-bucket-name1111"
}


