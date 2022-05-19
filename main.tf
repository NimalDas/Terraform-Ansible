terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

locals {
  vpc_id = "vpc-02aba9d571132e32f"
  subnet_id = "subnet-090b00b428115f9c9"
  ssh_user = "Ubuntu"
  key_name = "Ubuntu_keypair"
  private_key_path = "/home/nimaldaspsgmail/repo/ubuntu_keypair.pem"
}
resource "aws_instance" "server" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = local.key_name
  tags = {
    Name = "ND-IaC-EC2"
  }
}

