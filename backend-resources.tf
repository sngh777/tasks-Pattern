# 🔹 Create S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket-12345"  # Change this to a globally unique name

  lifecycle {
    prevent_destroy = false  # Allows deletion during `terraform destroy`
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}

# 🔹 Block Public Access (Security Best Practice)
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 🔹 Create DynamoDB Table for Terraform State Locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}