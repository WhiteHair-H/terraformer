resource "aws_nat_gateway" "tfer--nat-07e9bc7dd67adbb83" {
  allocation_id                      = "eipalloc-00771fe54beef4990"
  connectivity_type                  = "public"
  private_ip                         = "10.0.2.203"
  secondary_private_ip_address_count = "0"
  subnet_id                          = "subnet-00e443ca60f9ca813"

  tags = {
    Name = "weplat-ap2-nat"
  }

  tags_all = {
    Name = "weplat-ap2-nat"
  }
}
