module "networks" {
  source = "git::https://github.com/iaceit/terraform.aws-networks.git//module"

  region = var.region
}

module "secrets" {
  source = "git::https://github.com/iaceit/terraform.aws-secrets.git//module"

  region = var.region
}

resource "aws_db_instance" "main_mysql_db" {
  allocated_storage          = 10
  auto_minor_version_upgrade = true
  backup_retention_period    = 7
  db_subnet_group_name       = aws_db_subnet_group.main_internal_sg.id
  engine                     = "mysql"
  engine_version             = "5.7"
  instance_class             = "db.t2.micro"
  publicly_accessible        = false
  vpc_security_group_ids     = [module.networks.internal_sg_id]
  skip_final_snapshot        = true
  storage_type               = "gp2"

  name     = "main_mysql_db"
  username = "root"
  password = module.secrets.db_password
  port     = "3306"

  tags = merge(
    {
      "Name" = "main_mysql_db"
    },
    var.tags,
  )
}

resource "aws_db_subnet_group" "main_internal_sg" {
  name        = "main_internal_sg"
  description = "private internal subnet group"

  subnet_ids = [
    module.networks.main_private_subnet-a_id,
    module.networks.main_private_subnet-b_id,
  ]

  tags = merge(
    {
      "Name" = "main_internal_sg"
    },
    var.tags,
  )
}

