resource "kubernetes_deployment" "main_website_deployment" {

  metadata {
    namespace = "${var.deployment_environment}"
    name = "main-website-deployment"
    labels { run = "main-website" }
  }

  spec {
    replicas = 1
    selector {
      match_labels { run = "main-website" } }

    template {
      metadata {
        labels { run = "main-website" }
      }

      spec {
        image_pull_secrets = [ { name = "nexus-creds" } ]

        container {
          image             = "${var.deployment_image}"
          name              = "main-website-container"
          image_pull_policy = "Always"
        }
      }
    }
  }
}
