#----------------------------------------------------------------------------------------------------------
# Example JSON
#
# Uses jsondecode() function to pull the JSON in an HCL local variable that can be used in plans.
#----------------------------------------------------------------------------------------------------------
locals {
  sample_json = <<EOT
{ "admin": {
    "name": {
      "given": "Admin",
      "family": "User" },
    "email": "demo-user@mailinator.com",
    "population": "Admins",
    "roles": [
      "DaVinci Admin",
      "Environment Admin",
      "Identity Data Admin"]
  },
  "admin2": {
    "name": {
      "given": "Admin2",
      "family": "User" },
    "email": "demo-user@mailinator.com",
    "population": "Acme Population 2",
    "roles": [
      "Client Application Developer",
      "DaVinci Admin",
      "Environment Admin",
      "Identity Data Admin"]
  }
}
EOT
  sample_data = jsondecode(local.sample_json)
  #
  # Example below showing to pull in json from a file, rather than a local variable
  #
  # sample_data = jsondecode(file("${path.module}/input/users.json"))
}

# output "debug" {
#   value = local.sample_data
# }

resource "pingone_environment" "demo_environment" {
  name       = var.environment_name
  type       = "SANDBOX"
  license_id = var.license_id


  default_population {
    name        = "Demo Population"
    description = "Demo population for users"
  }

  service {
    type = "SSO"
  }

  service {
    type = "DaVinci"
  }
}


#----------------------------------------------------------------------------------------------------------
#
# Admin User Roles
#
#----------------------------------------------------------------------------------------------------------
module "admin_user_roles" {
  source = "../../modules/admin-user-roles"

  pingone_environment_id = var.pingone_environment_id
  username               = "pinglibrary-demo"
  roles                  = toset(["DaVinci Admin", "Environment Admin", "Identity Data Admin"])
  scoped_environment_id  = resource.pingone_environment.demo_environment.id
}

#----------------------------------------------------------------------------------------------------------
#
# Bulk Users
#
#----------------------------------------------------------------------------------------------------------
module "bulk_users" {
  source = "../../modules/bulk-users"

  pingone_environment_id = resource.pingone_environment.demo_environment.id
  bulk_users             = jsondecode(local.sample_json)
}

#----------------------------------------------------------------------------------------------------------
#
# Create Worker App and assign roles to the admin user passed
#
#----------------------------------------------------------------------------------------------------------
resource "pingone_application" "worker_app" {
  environment_id = resource.pingone_environment.demo_environment.id
  name           = "${var.environment_name} Worker App"
  enabled        = true

  oidc_options {
    type                        = "WORKER"
    grant_types                 = ["CLIENT_CREDENTIALS"]
    token_endpoint_authn_method = "CLIENT_SECRET_BASIC"
  }
}

#
# Admin User Roles
#
module "app_roles" {
  source = "../../modules/application-roles"

  pingone_application = resource.pingone_application.worker_app
  roles               = toset(["Client Application Developer", "Environment Admin", "Identity Data Admin"])
}
