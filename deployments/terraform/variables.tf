variable "deployment_image" {
  default = "docker.fuchicorp.com/fuchicorp-website:latest"
}
variable "deployment_environment" {
  default = "dev"
}
variable "replicas" {
  default = "3"
}
variable "deployment_endpoint" {
  type = "map"
  default = {
      dev  = "dev.fuchicorp"
      qa   = "qa.fuchicorp"
      prod = "fuchicorp"
      test = "test.fuchicorp"
      stage  = "stage.fuchicorp"
  }
}
variable "google_domain_name" {
 default = "fuchicorp.com"
  }
