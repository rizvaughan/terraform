resource "aws_internet_gateway" "webservergw" {
  vpc_id = aws_vpc.webvpc.id
}
