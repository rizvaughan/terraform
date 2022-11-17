resource "aws_route_table" "routes" {
  vpc_id = aws_vpc.webvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.webservergw.id
  }
  tags = {
    Name = "Route table"
  }
}

resource "aws_route_table_association" "rt_assoc1" {
  subnet_id      = aws_subnet.puba.id
  route_table_id = aws_route_table.routes.id
}

resource "aws_route_table_association" "rt_assoc2" {
  subnet_id      = aws_subnet.pubb.id
  route_table_id = aws_route_table.routes.id
}

#resource "aws_route_table_association" "rt_assoc3" {
 # subnet_id      = aws_subnet.pubc.id
  #route_table_id = aws_route_table.routes.id
#}
