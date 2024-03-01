locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env      = local.env_vars.locals.env
  bucket   = local.env_vars.locals.backend_config.bucket

  service  = "tgtest"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket  = local.bucket
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = templatefile(
    "./provider.tf.tftpl",
    {
      env     = local.env,
      service = local.service,
    }
  )
}

generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents  = file("./versions.tf")
}

inputs = {
  name_prefix = "${local.service}-${local.env}"
}
