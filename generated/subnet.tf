resource "aws_subnet" "tfer--subnet-003d5ab23920809cf" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.0.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "weplat-ap2-pub-sub-1"
  }

  tags_all = {
    Name = "weplat-ap2-pub-sub-1"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_subnet" "tfer--subnet-00666d12edd44330b" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0c2a58035c2f90a99"
}

resource "aws_subnet" "tfer--subnet-00e443ca60f9ca813" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.2.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "weplat-ap2-pub-sub-2"
  }

  tags_all = {
    Name = "weplat-ap2-pub-sub-2"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_subnet" "tfer--subnet-01d2227114d4ef3a8" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.10.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "weplat-ap2-pri-sub-4"
  }

  tags_all = {
    Name = "weplat-ap2-pri-sub-4"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_subnet" "tfer--subnet-02b1be9edb3d7576f" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.8.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "weplat-ap2-pri-sub-3"
  }

  tags_all = {
    Name = "weplat-ap2-pri-sub-3"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_subnet" "tfer--subnet-02b9a0f2363eba094" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.6.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "weplat-ap2-pri-sub-2"
  }

  tags_all = {
    Name = "weplat-ap2-pri-sub-2"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_subnet" "tfer--subnet-047454edd9c2822cd" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0c2a58035c2f90a99"
}

resource "aws_subnet" "tfer--subnet-0a30d205deb762d03" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0c2a58035c2f90a99"
}

resource "aws_subnet" "tfer--subnet-0a4de8d0892330ae6" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.4.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "weplat-ap2-pri-sub-1"
  }

  tags_all = {
    Name = "weplat-ap2-pri-sub-1"
  }

  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_subnet" "tfer--subnet-0dcecbba17d8d25b2" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.48.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0c2a58035c2f90a99"
}
