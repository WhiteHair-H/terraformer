resource "aws_eip" "tfer--eipalloc-00771fe54beef4990" {
  domain               = "vpc"
  network_border_group = "ap-northeast-2"
  network_interface    = "eni-05dc5933f96776e60"
  public_ipv4_pool     = "amazon"
  vpc                  = "true"
}
