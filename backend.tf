terraform {
  backend "s3" {
    bucket         = "terraform-state-storage-847068433460"
    key            = "state/terraform-tk1.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    profile        = "sandbox"
  }
}





