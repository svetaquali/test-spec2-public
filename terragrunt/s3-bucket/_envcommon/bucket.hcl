# ---------------------------------------------------------------------------------------------------------------------
# COMMON TERRAGRUNT CONFIGURATION
# This is the common component configuration for mysql. The common variables for each environment to
# deploy mysql are defined here. This configuration will be merged into the environment configuration
# via an include block.
# ---------------------------------------------------------------------------------------------------------------------

locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment

  # Expose the base source URL so different versions of the module can be deployed in different environments. This will
  # be used to construct the source URL in the child terragrunt configurations.
  # base_source_url = "git::git@github.com:yakirlevi/iac-samples.git//terraform/s3-create-bucket-2"
  # base_source_url = "git::git@github.com:QualiNext/test-spec2-public.git//terraform/s3-create-bucket"
  base_source_url = "git::https://github.com/QualiNext/test-spec2-public.git//terraform/s3-create-bucket"
}

# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module. This defines the parameters that are common across all
# environments.
# ---------------------------------------------------------------------------------------------------------------------
inputs = {
  # name              = "mysql_${local.env}"
  name = "${get_env("TF_VAR_bucket_name", "created-by-terragrunt")}"
}
