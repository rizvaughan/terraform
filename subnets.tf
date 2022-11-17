resource "aws_subnet" "puba" {
  vpc_id                  = aws_vpc.webvpc.id
  cidr_block              = var.cidr1
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"
  tags = {
    Name = "first public"
  }
}

resource "aws_subnet" "pubb" {
  vpc_id                  = aws_vpc.webvpc.id
  cidr_block              = var.cidr2
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1b"
  tags = {
    Name = "second public"
  }
}

resource "aws_subnet" "pubc" {
  vpc_id                  = aws_vpc.webvpc.id
  cidr_block              = var.cidr3
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1c"
  tags = {
    Name = "third public"
  }
}

resource "aws_subnet" "prva" {
  vpc_id                  = aws_vpc.webvpc.id
  cidr_block              = var.cidr4
  map_public_ip_on_launch = false
  availability_zone       = "eu-west-1a"
  tags = {
    Name = "first private"
  }
}

resource "aws_subnet" "prvb" {
  vpc_id                  = aws_vpc.webvpc.id
  cidr_block              = var.cidr5
  map_public_ip_on_launch = false
  availability_zone       = "eu-west-1b"
  tags = {
    Name = "second private"
  }
}

