terraform {
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = "~> 0.20"
    }
  }
}


# provider "pingone" {
#   environment_id = var.pingone_environment_id
#   client_id      = var.pingone_client_id
#   client_secret  = var.pingone_client_secret
#   region         = var.pingone_region
# }
