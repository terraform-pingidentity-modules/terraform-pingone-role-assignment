#!/bin/bash

source script-lib.sh

TF_ENV="${1}"

validate_env "${TF_ENV}"
validate_tfvars "${TF_ENV}"

echo
echo "Destroying ${TF_ENV}"
echo

read -p "Are you sure (if yes, type in the evn name '${TF_ENV}')) ? "

if test "$REPLY" != "${TF_ENV}"; then
    echo "Exiting..."
    exit 1
fi

terraform init -upgrade

terraform workspace select ${TF_ENV}

if test $? -eq 0; then
    terraform destroy --var-file=variables.${TF_ENV}.tfvars --auto-approve

    if test $? -eq 0; then
        echo ""
        echo "If you would like to permanently delete the state and history:"
        echo ""
        echo "  terraform workspace delete ${TF_ENV}"
        echo ""
    fi
else
    echo "Environment '${TF_ENV}' not found!"
fi
