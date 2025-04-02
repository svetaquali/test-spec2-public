# inputs
variable "test_string1" {
    type = string
    description = "ddd1"
    default = "the default1"
}

variable "test_string2" {
    type = string
    default = "the default2"
}

variable "test_string3" {
    type = string
}

variable "test_number" {
   type = number
   default = 5
}

variable "test_bool" {
    type = bool
    default = true
}