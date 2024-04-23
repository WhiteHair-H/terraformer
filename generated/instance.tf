resource "aws_instance" "tfer--i-01c71d3b0aaedd036_weplat-ap2-Bastion" {
  ami                         = "ami-0432815cad43e4bd1"
  associate_public_ip_address = "true"
  availability_zone           = "ap-northeast-2c"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count = "1"

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  cpu_threads_per_core = "2"

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.medium"
  ipv6_address_count                   = "0"
  key_name                             = "weplat-key"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "10.0.2.160"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    volume_size           = "8"
    volume_type           = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = "subnet-00e443ca60f9ca813"

  tags = {
    Name = "weplat-ap2-Bastion"
  }

  tags_all = {
    Name = "weplat-ap2-Bastion"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["sg-06c80bfc2e066347b"]
}

resource "aws_instance" "tfer--i-04234f3722e44ae06_weplat-ap2-monitoring" {
  ami                         = "ami-09a7535106fbd42d5"
  associate_public_ip_address = "false"
  availability_zone           = "ap-northeast-2c"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count = "1"

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  cpu_threads_per_core = "2"

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.large"
  ipv6_address_count                   = "0"
  key_name                             = "weplat-key"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "10.0.6.140"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "20"
    volume_type           = "gp3"
  }

  source_dest_check = "true"
  subnet_id         = "subnet-02b9a0f2363eba094"

  tags = {
    Name = "weplat-ap2-monitoring"
  }

  tags_all = {
    Name = "weplat-ap2-monitoring"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["sg-0ea725adb0278cb4b"]
}
