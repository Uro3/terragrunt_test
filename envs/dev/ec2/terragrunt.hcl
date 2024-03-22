include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    public_subnet_id = "fake"
  }
}

terraform {
  source = "${path_relative_from_include()}/modules/ec2"
}

inputs = {
  subnet_id = dependency.vpc.outputs.public_subnet_id
}
