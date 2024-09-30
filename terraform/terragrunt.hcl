# Configure remote state backend variables
locals {
    bucket-name = "maria-s-tfstate-s3-bucket"
    bucket-key = "backend/terraform.tfstate"
    region = "us-east-1"
    dynamodb-table-name = "maria-s-tfstate-s3-bucket-lock"
}

remote_state {
    backend = "s3"
    generate = {
        path = "00-backend.tf"
        if_exists = "overwrite_terragrunt"
    }
    config = {
        bucket = local.bucket-name
        key = local.bucket-key
        region = local.region
        encrypt = true
        dynamodb_table = local.dynamodb-table-name
    }
}