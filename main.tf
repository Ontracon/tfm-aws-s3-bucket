# # ============================================================================ #
# #                                     Setup                                    #
# # ============================================================================ #
# 
module "common" {
  source               = "git::https://github.com/Ontracon/tfm-cloud-commons.git?ref=1.0.2"
  cloud_region         = var.cloud_region
  global_config        = var.global_config
  custom_tags          = var.custom_tags
  custom_name          = var.custom_name
  commons_file_json    = var.commons_file_json
  local_file_json_tpl  = var.local_file_json_tpl
  naming_file_json_tpl = var.naming_file_json_tpl
}

# Common module used for Global Naming of all modules
# name     = module.common.names.resource_type["azurerm_resource_group"].name
# tags     = module.common.tags


resource "aws_s3_bucket" "this" {
  bucket = module.common.names.resource_type["aws_s3_bucket"].name
  tags   = module.common.tags
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}