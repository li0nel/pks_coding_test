variable "stack_name" {
  type = "string"
}

variable "aws_region" {
  type = "string"
}

variable "aws_profile" {
  type = "string"
}

variable "users" {
  type = "map"
}

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
  version = "~> 1.9"
}

data "external" "users" {
  program = ["cat", "${path.module}/users.json"]
  query   = {}
}

data "external" "hosts" {
  program = ["cat", "${path.module}/hosts.json"]
  query   = {}
}

// vm
# module "ec2" {
#   // loop on hosts
#   source           = "./modules/ec2"
#   stack_name       = "${var.stack_name}"
#   vpc_id           = "${module.vpc.vpc_id}"
#   public_subnet_id = "${module.vpc.public_subnet_ids[0]}"
# }