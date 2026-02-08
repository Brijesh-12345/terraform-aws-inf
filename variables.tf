variable "aws_region" {}
variable "vpc_cidr" {}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "ami_id" {}
variable "key_name" {}

variable "environment" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
}

variable "db_name" {
  type = string
}



variable "db_instance_class_primary" {
  type = string
}

variable "private_alb_name" {
  type = string
}

variable "project" {
  type = string
}

variable "public_alb_name" {
  type = string
}

variable "cdn_enabled" {
  type = bool
}

variable "ec2_instance_type_2" {
  type = string
}


