terraform {
 backend "remote" {
   organization = "aais-rezak"
   workspaces {
     name = "tfc-guide-example"   
	}
 }
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

resource "aws_instance" "app_server" {
  ami           = "ami-0ab4d1e9cf9a1215a"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance.20210624"
  }
}
