resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "public_ap_southeast_1a" {
  subnet_id      = aws_subnet.public_ap_southeast_1a.id
  route_table_id = aws_route_table.public.id
}
