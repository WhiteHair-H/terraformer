resource "aws_route_table_association" "tfer--subnet-003d5ab23920809cf" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-07480e8352904fb25_id}"
  subnet_id      = "subnet-003d5ab23920809cf"
}

resource "aws_route_table_association" "tfer--subnet-00e443ca60f9ca813" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-07480e8352904fb25_id}"
  subnet_id      = "subnet-00e443ca60f9ca813"
}

resource "aws_route_table_association" "tfer--subnet-01d2227114d4ef3a8" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-03a404ed38a96eef0_id}"
  subnet_id      = "subnet-01d2227114d4ef3a8"
}

resource "aws_route_table_association" "tfer--subnet-02b1be9edb3d7576f" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-03a404ed38a96eef0_id}"
  subnet_id      = "subnet-02b1be9edb3d7576f"
}

resource "aws_route_table_association" "tfer--subnet-02b9a0f2363eba094" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-0365ee463456f65fd_id}"
  subnet_id      = "subnet-02b9a0f2363eba094"
}

resource "aws_route_table_association" "tfer--subnet-0a4de8d0892330ae6" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-0365ee463456f65fd_id}"
  subnet_id      = "subnet-0a4de8d0892330ae6"
}
