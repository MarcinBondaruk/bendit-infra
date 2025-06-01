terraform {
  source = "../../../../ec2/main.tf"
}

include {
  path = find_in_parent_folders("root.hcl")
}