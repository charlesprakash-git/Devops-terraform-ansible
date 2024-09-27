terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0e54eba7c51c234f6"
  vpc_security_group_ids  = ["sg-0da30575f1954798b"]
  instance_type = "t2.micro"
  key_name = "charles-import"

  tags = {
    Name = "charles-DevOps-batch-server"
    env = "Production"
    owner = "charles"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

