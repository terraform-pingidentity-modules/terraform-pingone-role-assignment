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
| [pingone_role_assignment_user.admin_user_role](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/role_assignment_user) | resource |
| [pingone_role.admin_role](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/role) | data source |
| [pingone_role.roles](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/role) | data source |
| [pingone_user.admin_user](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pingone_environment_id"></a> [pingone\_environment\_id](#input\_pingone\_environment\_id) | PingOne Environment to affect user | `string` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | Set of role names | `set(string)` | n/a | yes |
| <a name="input_scoped_environment_id"></a> [scoped\_environment\_id](#input\_scoped\_environment\_id) | PingOne Environment to assign roles to | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Username of admin user in PingOne Environment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_roles"></a> [admin\_roles](#output\_admin\_roles) | n/a |
<!-- END_TF_DOCS -->