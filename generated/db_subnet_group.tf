resource "aws_db_subnet_group" "tfer--weplat-ap2-db-subnet-group" {
  description = "weplat-ap2-db-subnet-group"
  name        = "weplat-ap2-db-subnet-group"
  subnet_ids  = ["subnet-01d2227114d4ef3a8", "subnet-02b1be9edb3d7576f"]
}
