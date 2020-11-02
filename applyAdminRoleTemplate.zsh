# stop on error
set -e

userARN="$1"

echo "Creating the stack AWSAdminRole that will grant admin rights to user ${userARN} on the account $AWS_PROFILE"
aws cloudformation create-stack --stack-name AWSAdminRole --template-body file://template.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=UserARN,ParameterValue=$userARN