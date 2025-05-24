remote_state {
  backend = "s3"
  config = {
    bucket         = "bendit-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = false
  }
}