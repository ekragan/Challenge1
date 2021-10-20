## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_network.sql_vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_network_peering.peering2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering) | resource |
| [google_compute_subnetwork.db_subnet1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_sql_database.database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.sql_db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mysite_static_ip"></a> [mysite\_static\_ip](#input\_mysite\_static\_ip) | Static IP address | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project where the terraform resource will be created | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where tfm resource will be created | `any` | n/a | yes |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | User password for DB | `any` | n/a | yes |
| <a name="input_wp_vpc_id"></a> [wp\_vpc\_id](#input\_wp\_vpc\_id) | kubernetes cluster - application server - testing 1 wordpress | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dbname"></a> [dbname](#output\_dbname) | Database name |
| <a name="output_pass"></a> [pass](#output\_pass) | Password |
| <a name="output_pubip"></a> [pubip](#output\_pubip) | Public IP |
| <a name="output_sql_vpc_id"></a> [sql\_vpc\_id](#output\_sql\_vpc\_id) | VPC ID where cloudsql is created |
| <a name="output_uname"></a> [uname](#output\_uname) | Name |
