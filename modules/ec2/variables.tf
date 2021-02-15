variable "stack_name" {}
variable "host_name" {}
variable "public_subnet_id" {}
variable "vpc_id" {}

variable "public_ips" { 
    type = map
    default = {}
}

variable "users" { 
    type = map
    default = {}
}
