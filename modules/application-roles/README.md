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
| [pingone_application_role_assignment.app_role](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application_role_assignment) | resource |
| [pingone_role.roles](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pingone_application"></a> [pingone\_application](#input\_pingone\_application) | PingOne application to assign roles to | `any` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | Set of role names | `set(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->