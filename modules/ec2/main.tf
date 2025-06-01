variable "security_group_id" {}
variable "associate_public_ip_address" {}
variable "instance_type" {}
variable "aws_region" {}
variable "subnet_id" {}
variable "ami_id" {}
variable "key_name" {}

terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "docker_host" {
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = var.associate_public_ip_address
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  ami = var.ami_id
  key_name = var.key_name

  tags = {
    Name = "DockerHost"
  }
}
