resource "aws_vpc" "auto_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC_from_terraform"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "auto_igw" {
  vpc_id = aws_vpc.auto_vpc.id
  tags = {
    Name = "igw_from_terraform"
  }
}
# ====subnet====
resource "aws_subnet" "auto_public_subnet_1" {
  vpc_id            = aws_vpc.auto_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-3a"
  tags = {
    Name = "public_from_terraform_1"
  }
}

resource "aws_subnet" "auto_public_subnet_2" {
  vpc_id            = aws_vpc.auto_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-3b"
  tags = {
    Name = "public_from_terraform_2"
  }
}

#===public routing===
resource "aws_route_table" "auto_public_route" {
  vpc_id = aws_vpc.auto_vpc.id
  tags = {
    Name = "auto_public_routing"
  }
}

