terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-12345"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    profile        = "sandbox"
  }
}





