
#----------------------------------------------------------------------------------------------------------
# Assign roles to a user in a PingOne environment for a specific scoped environment
#
# - pingone_app_id
# - username
# - roles
# - scoped_environment_id
#
#----------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------
# Roles - Get Roles to assign
#----------------------------------------------------------------------------------------------------------
data "pingone_role" "roles" {
  for_each = var.roles
  name     = each.value
}

resource "pingone_application_role_assignment" "app_role" {
  for_each             = data.pingone_role.roles
  environment_id       = var.pingone_application.environment_id
  application_id       = var.pingone_application.id
  role_id              = each.value.id
  scope_environment_id = var.pingone_application.environment_id
}

