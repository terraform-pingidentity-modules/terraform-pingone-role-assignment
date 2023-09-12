module "example" {
  source = "./examples/users"

  pingone_environment_id = var.pingone_environment_id
  pingone_client_id      = var.pingone_client_id
  pingone_client_secret  = var.pingone_client_secret
  pingone_region         = var.pingone_region
  environment_name       = var.environment_name
  license_id             = var.license_id
}
