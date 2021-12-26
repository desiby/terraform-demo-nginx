terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                      = var.region
  access_key                  = var.aws_key_id
  secret_key                  = var.aws_secret
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "https://742a-3-17-133-122.ngrok.io"
  }

}

module "instance-nginx" {
  source             = "app.terraform.io/example-org-0e93fe/instance-nginx/aws"
  version            = "1.0.1"
  region             = var.region
  env                = var.env
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.0.0/20"
  instance_type      = "t3.micro"
  tags = {
    Name = "my-server-${var.env}"
  }
}