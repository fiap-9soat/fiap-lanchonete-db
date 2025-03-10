variable "vpc_id" {
  description = "The ID of the VPC which will be used to fetch all related information"
  type        = string
}

variable "db_user" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}
