output "vpc_id" {
  value = aws_vpc.rds_vpc.id
}

output "subnet_ids" {
  value = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
}
