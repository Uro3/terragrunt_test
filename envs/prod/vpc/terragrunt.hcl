include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}/modules/vpc"
}

inputs = {
  vpc_cidr_block = "10.1.0.0/16"
}
