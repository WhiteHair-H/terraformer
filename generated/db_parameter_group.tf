resource "aws_db_parameter_group" "tfer--weplat-ap2-db-pg" {
  description = "weplat-ap2-db-pg"
  family      = "mysql8.0"
  name        = "weplat-ap2-db-pg"
}
