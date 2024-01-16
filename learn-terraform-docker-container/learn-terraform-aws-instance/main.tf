terraform {

cloud {
    organization = "alex_ayala_palacin_org"
    workspaces {
      name = "learn-tfc-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami = "ami-0cd3c7f72edd5b06d"
  instance_type = "t2.micro"
  key_name= "ansible"

  tags = {
    Name = var.instance_name
  }
}
