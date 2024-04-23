resource "aws_main_route_table_association" "tfer--vpc-0c2a58035c2f90a99" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-07e8df72327b70750_id}"
  vpc_id         = "vpc-0c2a58035c2f90a99"
}

resource "aws_main_route_table_association" "tfer--vpc-0e5dffb22a77634a0" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-0cb8d7a637f42d92f_id}"
  vpc_id         = "vpc-0e5dffb22a77634a0"
}
