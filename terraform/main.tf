provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr      = "10.10.0.0/16"
  subnet_1_cidr = "10.10.1.0/24"
  subnet_2_cidr = "10.10.2.0/24"
  az_1          = "${var.region}a"
  az_2          = "${var.region}b"
}

module "compute" {
  source = "./modules/compute"

  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.subnet_ids
  instance_type  = "t3.micro"
  key_name       = var.key_name

  domain_name = "tadikonda.store"
  subdomain   = "intent"
}