resource "helm_release" "main_website_services_ingress" {

  name = "main-website-services-ingress-${var.deployment_environment}"
  namespace = "${var.deployment_environment}"
  chart = "./fuchicorp-website"

  set {
    name = "dns_endpoint"
    value = "${lookup(var.dns_endpoint_main-website, "${var.deployment_environment}")}"
  }

  set {
    name = "main_website_service"
    value = "${kubernetes_service.main_website_service.metadata.0.name}"
  }

  set {
    name = "main_website_port"
    value = "${kubernetes_service.main_website_service.spec.0.port.0.port}"
  }


  set {
    name = "email"
    value = "${var.lets_encrypt_email}"
  }

}
