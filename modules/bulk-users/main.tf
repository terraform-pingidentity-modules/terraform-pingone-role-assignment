
#----------------------------------------------------------------------------------------------------------
# Parse user and role data from user.json and create 3 objects
#
# - user_data       - Full users.json
# - population_data - Unique set of all roles identified in uesrs.json
# - role_data       - Unique set of all roles identified in uesrs.json
# - user_role_data  - User to role associations
#
# Example users.json
# {
#   "admin": {
#     "name": {
#       "given": "Admin",
#       "family": "User"
#     },
#     "email": "dem-usr@mailinator.com",
#     "population": "Admins",
#     "roles": [
#       "DaVinci Admin",
#       "Environment Admin",
#       "Identity Data Admin"
#     ]
#   },...
# }
#----------------------------------------------------------------------------------------------------------
locals {
  env_id          = var.pingone_environment_id
  user_data       = var.bulk_users
  population_data = toset(distinct(concat([], [for u in local.user_data : [u.population]]...)))
  role_data       = toset(distinct(concat([], [for u in local.user_data : u.roles]...)))
  user_role_data = flatten([
    for user in keys(local.user_data) : [
      for role in local.user_data[user].roles : {
        user = user
        role = role
      }
    ]
  ])
}

# output "user_role_data" {
#   value = local.user_role_data
# }

#----------------------------------------------------------------------------------------------------------
# Create Populations based on the local.population_data
#----------------------------------------------------------------------------------------------------------
# output "populations" {
#   value = local.population_data
# }
resource "pingone_population" "populations" {
  for_each       = local.population_data
  environment_id = local.env_id
  name           = each.value
  description    = each.value
}

#----------------------------------------------------------------------------------------------------------
# Create Users based on local.user_data
#----------------------------------------------------------------------------------------------------------
resource "pingone_user" "admin_user" {
  environment_id = local.env_id

  for_each      = local.user_data
  username      = each.key
  email         = each.value.email
  name          = each.value.name
  population_id = resource.pingone_population.populations[each.value.population].id
}
#----------------------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------------------
# Assign roles to users based on the local.user_role_data
#----------------------------------------------------------------------------------------------------------
data "pingone_role" "roles" {
  for_each = local.role_data
  name     = each.value
}
resource "pingone_role_assignment_user" "admin_role" {
  for_each             = { for e in local.user_role_data : "${e.user}.${e.role}" => e }
  environment_id       = local.env_id
  user_id              = resource.pingone_user.admin_user[each.value.user].id
  role_id              = data.pingone_role.roles[each.value.role].id
  scope_environment_id = local.env_id
}
