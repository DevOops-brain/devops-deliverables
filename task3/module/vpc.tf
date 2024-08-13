## VPC
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

## Subnet
resource "aws_subnet" "public" {
  cidr_block                      = cidrsubnet(var.vpc_cidr, 4, 2)
  vpc_id                          = aws_vpc.this.id
    tags = {
    Name = "${lower(var.vpc_name)}-subnet"
  }
}

## Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name        = "${aws_subnet.public.id}_public"
  }

}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  timeouts {
    create = "5m"
  }
}

## Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${lower(var.vpc_name)}-igw"
  }
}