resource "aws_subnet" "public_ap_southeast_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/19"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-ap-southeast-1a"
  }
}
