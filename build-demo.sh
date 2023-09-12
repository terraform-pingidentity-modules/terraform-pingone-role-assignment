#!/bin/bash

source script-lib.sh

TF_ENV="${1}"

validate_env "${TF_ENV}"
validate_tfvars "${TF_ENV}"

echo "Building ${TF_ENV}"

terraform init -upgrade

terraform workspace select -or-create "${TF_ENV}"

terraform apply --var-file=variables.${TF_ENV}.tfvars --auto-approve
