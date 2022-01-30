locals {
  vpc_cidr = "10.123.0.0/16"
}

locals {
  security_groups = {
    public = {
      name        = "public_sg"
      description = "Public Access"
      ingress = {
        ssh = {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        http = {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
        nginx = {
          from_port = 8000
          to_port = 8000
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
    rds = {
      name        = "rds_sg"
      description = "rds access"
      ingress = {
        mysql = {
          from_port   = 3306
          to_port     = 3306
          protocol    = "tcp"
          cidr_blocks = [local.vpc_cidr]
        }
      }
    }
  }
}