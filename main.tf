data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "fiap-lanchonete"
    workspaces = {
      name = "lanchonete-infra-2"
    }
  }
}


module "rds" {
  source      = "./modules/rds"
  db_password = var.db_password
  db_user     = var.db_user
}

resource "aws_db_instance" "mysql" {
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro" # Free tier
  username            = var.db_user
  password            = var.db_password
  skip_final_snapshot = true

  vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.instance_ip_addr
  db_subnet_group_name   = data.terraform_remote_state.vpc.outputs.instance_ip_addr
}

