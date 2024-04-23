resource "aws_route_table" "tfer--rtb-0365ee463456f65fd" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-07e9bc7dd67adbb83"
  }

  tags = {
    Name = "weplat-ap2-pri-rt"
  }

  tags_all = {
    Name = "weplat-ap2-pri-rt"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_route_table" "tfer--rtb-03a404ed38a96eef0" {
  tags = {
    Name = "weplat-ap2-db-rt"
  }

  tags_all = {
    Name = "weplat-ap2-db-rt"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_route_table" "tfer--rtb-07480e8352904fb25" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0ec564750c1ae8b11"
  }

  tags = {
    Name = "weplat-ap2-pub-rt"
  }

  tags_all = {
    Name = "weplat-ap2-pub-rt"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_route_table" "tfer--rtb-07e8df72327b70750" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0d696797681c47676"
  }

  vpc_id = "vpc-0c2a58035c2f90a99"
}

resource "aws_route_table" "tfer--rtb-0cb8d7a637f42d92f" {
  vpc_id = "vpc-0e5dffb22a77634a0"
}
