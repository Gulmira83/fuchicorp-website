data "template_file" "fuchicorp_website_values" {
  template = "${file("./fuchicorp-website/template_values.yaml")}"
  vars = {
    domain_name = "${var.domain_name}"
    docker_image = "${var.docker_image}"
  }
}

resource "local_file" "fuchicorp_website_values_local_file" {
  content  = "${trimspace(data.template_file.fuchicorp_website_values.rendered)}"
  filename = "./fuchicorp-website/.cache/values.yaml"
}


resource "helm_release" "fuchicorp_website" {
  name       = "${var.name}"
  namespace = "${var.namespace}"
  chart = "./fuchicorp-website"
  version    = "${var.version}"
   values = [
    "${data.template_file.fuchicorp_website_values.rendered}"
  ]
}