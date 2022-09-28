# ---------------------------------------------------------------------------------------------------------------------
# Global Variables
# ---------------------------------------------------------------------------------------------------------------------
variable "cloud_region" {
  type        = string
  description = "Define the cloud region to use (AWS Region / Azure Location) which tf should use."
}

variable "global_config" {
  type = object({
    env             = string
    customer_prefix = string
    project         = string
    application     = string
    costcenter      = string
  })
  description = "Global config Object which contains the mandatory informations within OTC."
}

# ---------------------------------------------------------------------------------------------------------------------
# Custom Variables
# ---------------------------------------------------------------------------------------------------------------------
variable "custom_tags" {
  type        = map(string)
  default     = null
  description = "Set custom tags for deployment."
}

variable "custom_name" {
  type        = string
  default     = ""
  description = "Set custom name for deployment."
}

variable "commons_file_json" {
  type        = string
  default     = ""
  description = "Json file to override the commons fixed variables."
}

variable "local_file_json_tpl" {
  type        = string
  default     = ""
  description = "Json template file to override the local settings template."
}

variable "naming_file_json_tpl" {
  type        = string
  default     = ""
  description = "Json template file to override the naming template."
}