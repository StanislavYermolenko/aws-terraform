# --- networking/main.tf ---

resource "random_integer" "random" {
  min = 1
  max = 100
}

resource "aws_vpc" "mtc_vps" {
  cidr_block          = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support  = true

  tags = {
    Name = "mtc_vps-${random_integer.random.id}"
  }
}

resource "aws_subnet" "mtc_public_subnet" {
  count = length(var.public_cidrs)
  vpc_id = aws_vpc.mtc_vps.id
  cidr_block = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"][count.index]
  
  tags = {
    Name = "mtc_public_${count.index + 1}"
  }
}