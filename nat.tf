resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pubc.id
  tags = {
    Name = "nat"
  }
}

resource "aws_route_table" "nat_rt" {
  vpc_id = aws_vpc.webvpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

resource "aws_route_table_association" "nat_rt_assoc1" {
  subnet_id      = aws_subnet.prva.id
  route_table_id = aws_route_table.nat_rt.id
}

resource "aws_route_table_association" "nat_rt_assoc2" {
  subnet_id      = aws_subnet.prvb.id
  route_table_id = aws_route_table.nat_rt.id
}
 
