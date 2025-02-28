module "rds" {
  source      = "./modules/rds"
  db_password = var.db_password
  db_user     = var.db_user
}
