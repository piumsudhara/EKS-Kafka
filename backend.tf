terraform {
  backend "s3" {
    bucket       = var.tfstate_bucket_name
    key          = "terraform/terraform.tfstate"
    region       = var.aws_region
    encrypt      = true
    use_lockfile = true
  }
}