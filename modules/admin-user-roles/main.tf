
#----------------------------------------------------------------------------------------------------------
# Assign roles to a user in a PingOne environment for a specific scoped environment
#
# - pingone_environment_id
# - username
# - roles
# - scoped_environment_id
#
#----------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------
# Assign roles to users based on the local.user_role_data
#----------------------------------------------------------------------------------------------------------
data "pingone_role" "roles" {
  for_each = var.roles
  name     = each.value
}

#----------------------------------------------------------------------------------------------------------
# Assign roles to the admin user passed
#----------------------------------------------------------------------------------------------------------
data "pingone_user" "admin_user" {
  environment_id = var.pingone_environment_id
  username       = var.username
}
data "pingone_role" "admin_role" {
  for_each = var.roles
  name     = each.value
}
output "admin_roles" {
  value = data.pingone_role.admin_role
}

resource "pingone_role_assignment_user" "admin_user_role" {
  for_each             = data.pingone_role.admin_role
  environment_id       = var.pingone_environment_id
  user_id              = data.pingone_user.admin_user.id
  role_id              = each.value.id
  scope_environment_id = var.scoped_environment_id
}

