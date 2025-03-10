data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = var.hcp_org
    workspaces = {
      name = var.hcp_workspace
    }
  }
}

module "rds" {
  source      = "./modules/rds"
  db_password = var.db_password
  db_user     = var.db_user
  vpc_id      = data.terraform_remote_state.vpc.outputs.shared_vpc_id
}

