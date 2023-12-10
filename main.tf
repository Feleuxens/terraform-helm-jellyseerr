resource "helm_release" "" {
  name = ""

  repository       = ""
  chart            = ""
  version          = ""
  create_namespace = true
  namespace        = ""

  values = [
    templatefile("${path.module}/helm-values/values.yaml", {
      cpu_request : var.cpu_request,
      memory_request : var.memory_request,
      memory_limit : var.memory_limit
    })
  ]
  set_sensitive {
    name  = "secret"
    value = value
  }

  # depends_on = []
}