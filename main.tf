resource "helm_release" "jellyseerr" {
  name = "jellyseerr"

  repository       = "https://helm.feleuxens.de"
  chart            = "jellyseerr"
  version          = "0.1.1"
  create_namespace = true
  namespace        = "jellyseerr"

  values = [
    templatefile("${path.module}/helm-values/jellyseerr.yaml", {
      domain : var.domain
      cpu_request : var.cpu_request,
      memory_request : var.memory_request,
      memory_limit : var.memory_limit
    })
  ]
}