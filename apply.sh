#!/bin/bash

# Variables
BUCKET_NAME="wordlist-infrastructure-state"
REGION="eu-west-2"

# Check if the user is authenticated to AWS CLI
if ! aws sts get-caller-identity &>/dev/null; then
    echo "You are not authenticated to AWS CLI. Please run 'aws configure' to set up your credentials."
    exit 1
fi

# Check if the S3 bucket exists
if ! aws s3api head-bucket --bucket "$BUCKET_NAME" 2>/dev/null; then
    echo "S3 bucket '$BUCKET_NAME' does not exist. Creating it..."
    aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" \
        --create-bucket-configuration LocationConstraint="$REGION"
    echo "S3 bucket '$BUCKET_NAME' created successfully."
else
    echo "S3 bucket '$BUCKET_NAME' already exists."
fi

# Configure Terraform backend
cat > backend.tf <<EOF
terraform {
    backend "s3" {
        bucket         = "$BUCKET_NAME"
        key            = "terraform/state/terraform.tfstate"
        region         = "$REGION"
    }
}
EOF

echo "Terraform backend configured to use S3 bucket '$BUCKET_NAME'."

# Initialize Terraform
terraform init

# Apply the Terraform configuration
terraform apply 