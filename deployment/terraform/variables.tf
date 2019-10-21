  
variable "namespace" {
  default = "test"
}
variable "version" {
  default = "6.0.1"
}
variable "name" {
  default = "fuchicorp-website"
}
variable "domain_name" {
  default = "fuchicorp.com"
}
variable "docker_image" {
  default = "docker.fuchicorp.com/main-website-dev"
}
variable "docker_image_tag" {}
