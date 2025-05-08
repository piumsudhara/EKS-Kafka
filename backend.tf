terraform {  
  backend "s3" {  
    bucket       = "eks-kafka"  
    key          = "terraform/terraform.tfstate"  
    region       = "ap-southeast-1"  
    encrypt      = true  
    use_lockfile = true
  }  
}