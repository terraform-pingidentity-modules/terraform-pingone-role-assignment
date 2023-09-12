terraform {
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = "~> 0.20"
    }
  }

  # this provides access to an AWS resource like:
  #
  #   arn:aws:s3:::si-terraform/si-demo-env/{workspace-env}/terraform.tfstate
  #
  backend "s3" {
    bucket               = "si-terraform"
    region               = "us-west-2"
    workspace_key_prefix = "bx-government-demo"
    key                  = "terraform.tfstate"
  }
}


provider "pingone" {
  environment_id = var.pingone_environment_id
  client_id      = var.pingone_client_id
  client_secret  = var.pingone_client_secret
  region         = var.pingone_region
}
