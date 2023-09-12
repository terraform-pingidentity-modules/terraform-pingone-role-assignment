#!/bin/bash

validate_env() {
    envName=$1
    if test -z $envName; then
        echo "Usage: build-demo.sh {env}"
        echo ""
        echo "  env required.  Available environments (* - current env)"
        echo ""
        terraform workspace list
        exit 1
    fi
}

validate_tfvars() {
    envName=$1
    if test ! -f "variables.${envName}.tfvars"; then
        echo "ERROR: variables.${envName}.tfvars is required to continue"
        exit 1
    fi
}

validate_workspace() {
    envName=$1
    if test $? -eq 1; then
        echo "ERROR: Unable to select workspace env: ${envName}"
        echo ""
        echo "You need to run following command to create workspace env"
        echo ""
        echo "  terraform workspace new ${envName}"
        echo ""
        exit 1
    fi
}
