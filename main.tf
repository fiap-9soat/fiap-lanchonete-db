data "aws_vpc" "infra_vpc" {
  tags = {
    GithubRepo = "fiap-lanchonete-infra"
    GithubOrg  = "fiap-9soat"

  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.infra_vpc.id]
  }
}

data "aws_security_group" "eks_sg" {
  vpc_id = data.aws_vpc.infra_vpc.id
  tags = {
    Name = "eks-sg"
  }
}

resource "aws_db_subnet_group" "subnet_group" {
  subnet_ids = data.aws_subnets.private_subnets.ids
}


resource "aws_db_instance" "mysql" {
  identifier = "fiap-lanchonete-db"
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro" # Free tier
  username            = var.db_user
  password            = var.db_password
  skip_final_snapshot = true

  vpc_security_group_ids = [data.aws_security_group.eks_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
}

