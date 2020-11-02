#stop on any errors
set -e

userARN="$1"
awsOrganizationOuId="$2"

aws cloudformation create-stack-set --cli-input-yaml file://stackset.yaml --parameters ParameterKey=UserARN,ParameterValue=${userARN}

aws cloudformation create-stack-instances --cli-input-yaml file://stacksetInstance.yaml --deployment-targets OrganizationalUnitIds=${awsOrganizationOuId}