variable "deployment_environment" {
  default = "prod"
}

variable "dns_endpoint_main-website" {
  type = "map"

  default = {
    dev  = "dev.fuchicorp.com"
    qa   = "qa.fuchicorp.com"
    prod = "fuchicorp.com"
  }
}

variable "deployment_image" {
  default = "docker.fuchicorp.com/main-website-dev:0.5"
}

variable "lets_encrypt_email" {
  default = "fuchicorpsolutions@gmail.com"
}
