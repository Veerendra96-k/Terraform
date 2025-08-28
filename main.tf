terraform {
  required_version = ">= 1.0"
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
    source = "./modules/networking"

    project_name = "var.project_name"
    vpc_cidr    = "10.0.0.0/16"
    public_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    private_subnets_cidr = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"]  
}