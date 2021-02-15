variable "stack_name" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  version = "~> 3.0"
}

locals {
  users = jsondecode(file("${path.module}/users.json"))
  hosts = jsondecode(file("${path.module}/hosts.json"))
}

// for each host, needs to add users.

// vpc
module "vpc" {
  source     = "./modules/vpc"
  stack_name = var.stack_name
}

// vms
module "ec2" {
  count = length(local.hosts)
  source           = "./modules/ec2"
  stack_name       = join("-", [var.stack_name, local.hosts[count.index]])
  host_name        = local.hosts[count.index]
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
  users            = { for u in local.users: u.username => contains(u.allowed_hosts, local.hosts[count.index]) ? u.public_key : "" }
}
