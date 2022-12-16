# terraform-digitalocean-doks

<a href="https://registry.terraform.io/modules/nlamirault/doks/digitalocean/latest"><img src="https://img.shields.io/badge/Terraform-Registry-blue" alt="Terraform Registry"></a>

Terraform module which configure a Kubernetes cluster (DOKS) on Digital Ocean

## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_cluster.k8s](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_kubernetes_node_pool.node_pools](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_node_pool) | resource |
| [digitalocean_kubernetes_versions.k8s](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_versions) | data source |
| [digitalocean_sizes.k8s](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/sizes) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_scale"></a> [auto\_scale](#input\_auto\_scale) | Enable cluster autoscaling | `bool` | n/a | yes |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Whether the cluster will be automatically upgraded | `bool` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The Kubernetes version | `string` | n/a | yes |
| <a name="input_maintenance_policy_day"></a> [maintenance\_policy\_day](#input\_maintenance\_policy\_day) | The day of the maintenance window policy | `string` | n/a | yes |
| <a name="input_maintenance_policy_start_time"></a> [maintenance\_policy\_start\_time](#input\_maintenance\_policy\_start\_time) | The start time in UTC of the maintenance window policy in 24-hour clock format / HH:MM notation | `string` | n/a | yes |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Autoscaling maximum node capacity | `string` | `5` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Autoscaling Minimum node capacity | `string` | `1` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of Droplet instances in the node pool. | `number` | n/a | yes |
| <a name="input_node_labels"></a> [node\_labels](#input\_node\_labels) | List of Kubernetes labels to apply to the nodes | `map(any)` | <pre>{<br>  "service": "kubernetes"<br>}</pre> | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | Addons node pools | <pre>map(object({<br>    size        = string<br>    node_count  = number<br>    auto_scale  = bool<br>    min_nodes   = number<br>    max_nodes   = number<br>    node_tags   = list(string)<br>    node_labels = map(string)<br>  }))</pre> | `{}` | no |
| <a name="input_node_tags"></a> [node\_tags](#input\_node\_tags) | The list of instance tags applied to all nodes. | `list(any)` | <pre>[<br>  "kubernetes"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The location of the cluster | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | The slug identifier for the type of Droplet to be used as workers in the node pool. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of instance tags applied to the cluster. | `list(any)` | <pre>[<br>  "kubernetes"<br>]</pre> | no |
| <a name="input_vpc_uuid"></a> [vpc\_uuid](#input\_vpc\_uuid) | The ID of the VPC where the Kubernetes cluster will be located | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
