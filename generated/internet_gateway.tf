resource "aws_internet_gateway" "tfer--igw-0d696797681c47676" {
  vpc_id = "vpc-0c2a58035c2f90a99"
}

resource "aws_internet_gateway" "tfer--igw-0ec564750c1ae8b11" {
  tags = {
    Name = "weplat-ap2-igw"
  }

  tags_all = {
    Name = "weplat-ap2-igw"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}
