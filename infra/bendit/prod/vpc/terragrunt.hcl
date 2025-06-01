include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../modules/vpc/main.tf"
}

inputs = {
  aws_region         = "eu-north-1"
  vpc_cidr_block     = "10.69.0.0/16"
  public_subnet_cidr = "10.69.1.0/24"
  availability_zone  = "eu-north-1a"
}