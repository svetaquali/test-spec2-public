variable "test_string" {
    type = string
}

variable "test_list_string" {
    type = list(string)
}

variable "test_map_string" {
    type = map(string)
}

variable "test_object" {
    type = object({
        key1 = string,
        key2 = number
    })
}
