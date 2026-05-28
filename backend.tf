terraform {
  backend "s3" {
    bucket  = "jenkins-terraform-state-001"
    key     = "reclaim-prod/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
    use_lockfile = true
  }
}
