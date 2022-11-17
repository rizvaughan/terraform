resource "aws_security_group" "WebserverSG" {
  vpc_id = aws_vpc.webvpc.id
  name   = var.sg_name
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = var.cidr_block
  }
}
