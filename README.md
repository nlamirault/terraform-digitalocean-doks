# terraform-digitalocean-doks

<a href="https://registry.terraform.io/modules/nlamirault/doks/digitalocean/latest"><img src="https://img.shields.io/badge/Terraform-Registry-blue" alt="Terraform Registry"></a>

Terraform module which configure a Kubernetes cluster (DOKS) on Digital Ocean

## Versions

Use Terraform `0.13+` and Terraform Provider Digital Ocean `1.22.0+`

These types of resources are supported:

* [digitalocean_kubernetes_cluster](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster)
* [digitalocean_kubernetes_node_pool](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_node_pool)

## Usage

```hcl

module "kubernetes" {
  source  = "nlamirault/doks/digitalocean"
  version = "x.y.z"

  cluster_name       = var.cluster_name
  auto_upgrade       = var.auto_upgrade
  region             = var.region
  kubernetes_version = var.kubernetes_version
  tags               = var.tags

  size        = var.size
  auto_scale  = var.auto_scale
  min_nodes   = var.min_nodes
  max_nodes   = var.max_nodes
  node_count  = var.node_count
  node_tags   = var.node_tags
  node_labels = var.node_labels

  node_pools = var.node_pools
}
```

With variables :

```hcl
cluster_name = "portefaix-sandbox-do-k8s"

region = "fra1"

kubernetes_version = "1.18.10"
auto_upgrade = true
size = "s-1vcpu-2gb"

auto_scale = true
min_nodes = 1
max_nodes = 2
node_count = 1

node_labels = {
  env      = "prod"
  service  = "kubernetes"
  made-by  = "terraform"
}

node_tags = ["kubernetes", "nodes"]

node_pools = {}
#node_pools = {
#  "ops" = {
#    auto_scale = true
#    min_nodes = 1
#    max_nodes = 3
#    node_count = 1
#    size = "s-1vcpu-2gb"
#    node_labels = {
#      env      = "prod"
#      service  = "kubernetes"
#      made-by  = "terraform"
#  }
#    node_tags = ["kubernetes", "nodes"]
#  }
#}
```

This module creates :

* a Kubernetes cluster
* node pool(s)

## Documentation

### Providers

| Name | Version |
|------|---------|
| digitalocean | >= 1.22.0 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| auto\_scale | Enable cluster autoscaling | `bool` | n/a | yes |
| auto\_upgrade | Whether the cluster will be automatically upgraded | `bool` | n/a | yes |
| cluster\_name | Cluster name | `string` | n/a | yes |
| kubernetes\_version | The EKS Kubernetes version | `string` | n/a | yes |
| vpc_uuid | The ID of the VPC where the Kubernetes cluster will be located | `string` | "" | no |
| max\_nodes | Autoscaling maximum node capacity | `string` | `5` | no |
| min\_nodes | Autoscaling Minimum node capacity | `string` | `1` | no |
| node\_count | The number of Droplet instances in the node pool. | `number` | n/a | yes |
| node\_labels | List of Kubernetes labels to apply to the nodes | `map` | <pre>{<br>  "service": "kubernetes"<br>}</pre> | no |
| node\_pools | Addons node pools | <pre>map(object({<br>    size        = string<br>    node_count  = number<br>    auto_scale  = bool<br>    min_nodes   = number<br>    max_nodes   = number<br>    node_tags   = list(string)<br>    node_labels = map(string)<br>  }))</pre> | `{}` | no |
| node\_tags | The list of instance tags applied to all nodes. | `list` | <pre>[<br>  "kubernetes"<br>]</pre> | no |
| region | The location of the cluster | `string` | n/a | yes |
| size | The slug identifier for the type of Droplet to be used as workers in the node pool. | `string` | n/a | yes |
| tags | The list of instance tags applied to the cluster. | `list` | <pre>[<br>  "kubernetes"<br>]</pre> | no |

### Outputs

No output.
