resource "aws_db_instance" "mysql" {
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class = "db.t3.micro" # Free tier
  username            = var.db_user
  password            = var.db_password
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
}
