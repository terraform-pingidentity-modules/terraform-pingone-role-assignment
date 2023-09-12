<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_pingone"></a> [pingone](#requirement\_pingone) | ~> 0.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_pingone"></a> [pingone](#provider\_pingone) | 0.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [pingone_population.populations](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/population) | resource |
| [pingone_role_assignment_user.admin_role](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/role_assignment_user) | resource |
| [pingone_user.admin_user](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/user) | resource |
| [pingone_role.roles](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bulk_users"></a> [bulk\_users](#input\_bulk\_users) | Map of users to import.  Must follow schema in the examples | `map(any)` | n/a | yes |
| <a name="input_pingone_environment_id"></a> [pingone\_environment\_id](#input\_pingone\_environment\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->