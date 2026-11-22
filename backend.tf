
terraform {
  backend "s3" {
    bucket       = "besant-gnanesh-001"
    key          = "enterprise-aws-infrastructure/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
