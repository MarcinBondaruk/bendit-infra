variable "aws_region" {}
variable "vpc_cidr_block" {}
variable "public_subnet_cidr" {}
variable "availability_zone" {}

terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "bendit_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "bendit-vpc"
  }
}

resource "aws_internet_gateway" "bendit_gw" {
  vpc_id = aws_vpc.bendit_vpc.id

  tags = {
    Name = "bendit-gw"
  }
}

resource "aws_subnet" "bendit_public_subnet" {
  vpc_id                  = aws_vpc.bendit_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "bendit-public-subnet"
  }
}

resource "aws_route_table" "bendit_public_rt" {
  vpc_id = aws_vpc.bendit_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bendit_gw.id
  }

  tags = {
    Name = "bendit-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.bendit_public_subnet.id
  route_table_id = aws_route_table.bendit_public_rt.id
}
