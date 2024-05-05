# EC2建てるだけ
terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket  = "tastylog-tfstate-bucket-kamakari"
    key     = "tastylog-dev-tfstate"
    region  = "ap-northeast-1"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ab3794db9457b60a"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance-kamakari"
  }
}