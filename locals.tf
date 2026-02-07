locals {

  ec2_instances = {
    web1 = "t2.micro"
    web2 = "t2.small"
  }

  rds_config = {
    primary = {
      class = "db.t3.micro"
      multi_az = true
    }
    replica = {
      class = "db.t3.micro"
    }
  }

}
