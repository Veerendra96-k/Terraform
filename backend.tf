terraform{
    backend "s3" {
        bucket = "terraform-s-bucket-8908"
        key    = "network/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform-lock-table"
        encrypt = true
      
    }
}