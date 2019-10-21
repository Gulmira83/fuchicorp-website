  
variable "deployment_environment" {
  default = "qa"
}

variable "dns_endpoint_fuchicorp_website" {
  type = "map"

  default = {
    dev  = "dev.website.fuchicorp.com"
    qa   = "qa.website.fuchicorp.com"
    prod = "website.fuchicorp.com"
  }
}
variable "version" {
  default = "6.0.1"
}
variable "deployment_image" {}

variable "name" {
  default = "fuchicorp-website"
}
