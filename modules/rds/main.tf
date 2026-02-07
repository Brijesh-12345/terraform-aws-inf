resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnets
}


resource "aws_db_instance" "primary" {
  identifier          = "primary-db"
  engine              = "mysql"
  instance_class      = var.db_instance_class_primary
  allocated_storage   = 20
  multi_az            = true

  username            = var.db_username
  password            = var.db_password
  db_name             = var.db_name

  db_subnet_group_name = aws_db_subnet_group.rds.name
  skip_final_snapshot  = true
}

resource "aws_db_instance" "replica" {
  identifier          = "replica-db"
  replicate_source_db = aws_db_instance.primary.id
  instance_class      = var.db_instance_class_replica
  skip_final_snapshot = true
}
