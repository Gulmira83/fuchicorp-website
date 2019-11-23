data "template_file" "website_values" {
  template = "${file("website/values_template.yaml")}"

  vars {
    deployment_endpoint = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}"
    deployment_image    = "${var.deployment_image}"
  }
}

resource "local_file" "website_helm_chart_values" {
  content  = "${trimspace(data.template_file.website_values.rendered)}"
  filename = "website/.cache/website_values.yaml"
}

resource "helm_release" "helm_website_fuchicorp" {
  values = [
    "${data.template_file.website_values.rendered}",
  ]

  name      = "website-fuchicorp-${var.deployment_environment}"
  namespace = "${var.deployment_environment}"
  chart     = "./website"
}
