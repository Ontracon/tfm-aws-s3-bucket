terraform {
  required_version = "~> 1"
  backend "local" {}
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "s3" {
  for_each     = toset(["Name1", "Name2"])
  source       = "../../"
  cloud_region = "eu-central-1"
  global_config = {
    env             = "prd"
    customer_prefix = "otc"
    project         = "ttch22"
    application     = "simple"
    costcenter      = "0815"
  }
  custom_name = each.key

}
