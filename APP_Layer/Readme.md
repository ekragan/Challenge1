## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_address.static_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_network.wp_vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_network_peering.peering1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering) | resource |
| [google_compute_subnetwork.app_subnet1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_container_cluster.mysite_gke](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.mysite_cluster_nodes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [kubernetes_deployment.mysite](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_service.mysite_service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [null_resource.update_kubeconfig](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [google_client_config.provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_container_cluster.my_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_cluster) | data source |
| [google_project.prod_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dbname"></a> [dbname](#input\_dbname) | Database Name | `any` | n/a | yes |
| <a name="input_pass"></a> [pass](#input\_pass) | Password | `any` | n/a | yes |
| <a name="input_pubip"></a> [pubip](#input\_pubip) | Public IP | `any` | n/a | yes |
| <a name="input_sql_vpc_id"></a> [sql\_vpc\_id](#input\_sql\_vpc\_id) | SQL VPC | `any` | n/a | yes |
| <a name="input_uname"></a> [uname](#input\_uname) | Name | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mysite_static_ip"></a> [mysite\_static\_ip](#output\_mysite\_static\_ip) | n/a |
| <a name="output_mysite_vpc_id"></a> [mysite\_vpc\_id](#output\_mysite\_vpc\_id) | n/a |
| <a name="output_wp_vpc_id"></a> [wp\_vpc\_id](#output\_wp\_vpc\_id) | n/a |
