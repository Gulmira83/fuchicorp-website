resource "kubernetes_service" "main_website_service" {

  metadata {
    name = "main-website-service"
    namespace = "${var.deployment_environment}"
  }

  spec {
    selector { run = "main-website"  }

    port {
      port = 7107
      target_port = 80
    }

    type = "ClusterIP"
  }
}
