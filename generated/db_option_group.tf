resource "aws_db_option_group" "tfer--weplat-ap2-db-og" {
  engine_name              = "mysql"
  major_engine_version     = "8.0"
  name                     = "weplat-ap2-db-og"
  option_group_description = "weplat-ap2-db-og"
}
