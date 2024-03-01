include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}/modules/network"
}

inputs = {
  vpc_cidr_block = "10.0.0.0/16"
}
