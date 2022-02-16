#!/bin/sh
set -e

. ${GITHUB_WORKSPACE}/ops/tools/get-info-from-packagejson.sh

echo "--------------------- Terraform ---------------------------"

cd ${GITHUB_WORKSPACE}/ops/infra

export ENVIRONMENT=$GITHUB_ENVIRONMENT
export TF_VAR_SERVICE=$SERVICE
export TF_VAR_ENVIRONMENT=${ENVIRONMENT:-test}
export TF_VAR_REGION=$AWS_DEFAULT_REGION

export S3_TERRAFORM_STATE_BUCKET=terraform-my-dev-profile
export S3_TERRAFORM_STATE_REGION=$AWS_DEFAULT_REGION
export TERRAFORM_STATE_NAME="$SERVICE-$AWS_DEFAULT_REGION/terraform_deploy_${SERVICE}_${TF_VAR_ENVIRONMENT}.tfstate"

echo "Starting environment build"

echo "Starting terraform init"
terraform init \
 -backend-config="bucket=${S3_TERRAFORM_STATE_BUCKET}" \
 -backend-config="region=${S3_TERRAFORM_STATE_REGION}" \
 -backend-config="key=${TERRAFORM_STATE_NAME}"

echo "Starting terraform apply"
# terraform plan 
terraform apply -auto-approve
# terraform destroy -auto-approve

s3_uri="$(terraform output s3-uri)"

# back to the ops folder
rm -rf ${GITHUB_WORKSPACE}/ops/tmp/app || true
mkdir -p ${GITHUB_WORKSPACE}/ops/tmp/app
cp -R ${GITHUB_WORKSPACE}/dist/* ${GITHUB_WORKSPACE}/ops/tmp/app
aws s3 cp ${GITHUB_WORKSPACE}/ops/tmp/app/ s3://${s3_uri}/ --recursive --acl public-read