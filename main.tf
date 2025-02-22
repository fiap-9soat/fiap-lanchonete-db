terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "lanchonete"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  username             = "fiap"
  password             = "fiap"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
