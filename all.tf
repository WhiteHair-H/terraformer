terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_vpc" "EC2VPC" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
        Name = "weplat-ap2-vpc"
    }
}

resource "aws_subnet" "EC2Subnet" {
    availability_zone = "ap-northeast-2a"
    cidr_block = "10.0.8.0/24"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet2" {
    availability_zone = "ap-northeast-2a"
    cidr_block = "10.0.4.0/24"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet3" {
    availability_zone = "ap-northeast-2c"
    cidr_block = "10.0.2.0/24"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet4" {
    availability_zone = "ap-northeast-2c"
    cidr_block = "10.0.6.0/24"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet5" {
    availability_zone = "ap-northeast-2a"
    cidr_block = "10.0.0.0/24"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "EC2Subnet6" {
    availability_zone = "ap-northeast-2c"
    cidr_block = "10.0.10.0/24"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    map_public_ip_on_launch = false
}

resource "aws_internet_gateway" "EC2InternetGateway" {
    tags = {
        Name = "weplat-ap2-igw"
    }
    vpc_id = "${aws_vpc.EC2VPC.id}"
}

resource "aws_eip" "EC2EIP" {
    vpc = true
}

resource "aws_eip_association" "EC2EIPAssociation" {
    allocation_id = "eipalloc-00771fe54beef4990"
    network_interface_id = "eni-05dc5933f96776e60"
    private_ip_address = "10.0.2.203"
}

resource "aws_vpc_dhcp_options" "EC2DHCPOptions" {
    domain_name = "ap-northeast-2.compute.internal"
}

resource "aws_vpc_dhcp_options_association" "EC2VPCDHCPOptionsAssociation" {
    dhcp_options_id = "dopt-063773e7f762e9a61"
    vpc_id = "${aws_vpc.EC2VPC.id}"
}

resource "aws_route_table" "EC2RouteTable" {
    vpc_id = "${aws_vpc.EC2VPC.id}"
    tags = {
        Name = "weplat-ap2-pub-rt"
    }
}

resource "aws_route_table" "EC2RouteTable2" {
    vpc_id = "${aws_vpc.EC2VPC.id}"
    tags = {
        Name = "weplat-ap2-db-rt"
    }
}

resource "aws_route_table" "EC2RouteTable3" {
    vpc_id = "${aws_vpc.EC2VPC.id}"
    tags = {}
}

resource "aws_route_table" "EC2RouteTable4" {
    vpc_id = "${aws_vpc.EC2VPC.id}"
    tags = {
        Name = "weplat-ap2-pri-rt"
    }
}

resource "aws_route" "EC2Route" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0ec564750c1ae8b11"
    route_table_id = "rtb-07480e8352904fb25"
}

resource "aws_route" "EC2Route2" {
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "nat-07e9bc7dd67adbb83"
    route_table_id = "rtb-0365ee463456f65fd"
}

resource "aws_nat_gateway" "EC2NatGateway" {
    subnet_id = "subnet-00e443ca60f9ca813"
    tags = {
        Name = "weplat-ap2-nat"
    }
    allocation_id = "eipalloc-00771fe54beef4990"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation" {
    route_table_id = "rtb-07480e8352904fb25"
    subnet_id = "subnet-00e443ca60f9ca813"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation2" {
    route_table_id = "rtb-07480e8352904fb25"
    subnet_id = "subnet-003d5ab23920809cf"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation3" {
    route_table_id = "rtb-03a404ed38a96eef0"
    subnet_id = "subnet-02b1be9edb3d7576f"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation4" {
    route_table_id = "rtb-03a404ed38a96eef0"
    subnet_id = "subnet-01d2227114d4ef3a8"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation5" {
    route_table_id = "rtb-0365ee463456f65fd"
    subnet_id = "subnet-0a4de8d0892330ae6"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation6" {
    route_table_id = "rtb-0365ee463456f65fd"
    subnet_id = "subnet-02b9a0f2363eba094"
}

resource "aws_route53_zone" "Route53HostedZone" {
    name = "hyobeom.shop."
}

resource "aws_route53_record" "Route53RecordSet" {
    name = "hyobeom.shop."
    type = "A"
    alias {
        name = "dualstack.weplat-ap2-web-alb-1356917930.ap-northeast-2.elb.amazonaws.com."
        zone_id = "ZWKZPGTI48KDX"
        evaluate_target_health = true
    }
    zone_id = "Z071299925RUGS0OOY5Y9"
}

resource "aws_route53_record" "Route53RecordSet2" {
    name = "hyobeom.shop."
    type = "NS"
    ttl = 60
    records = [
        "ns-518.awsdns-00.net.",
        "ns-1398.awsdns-46.org.",
        "ns-1771.awsdns-29.co.uk.",
        "ns-410.awsdns-51.com."
    ]
    zone_id = "Z071299925RUGS0OOY5Y9"
}

resource "aws_route53_record" "Route53RecordSet3" {
    name = "hyobeom.shop."
    type = "SOA"
    ttl = 900
    records = [
        "ns-518.awsdns-00.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
    ]
    zone_id = "Z071299925RUGS0OOY5Y9"
}

resource "aws_route53_record" "Route53RecordSet4" {
    name = "_2cf7618835deda7cbcd3a3c407d95c30.hyobeom.shop."
    type = "CNAME"
    ttl = 300
    records = [
        "_6350411fb836279dcbe5e522faa3e3e2.mhbtsbpdnt.acm-validations.aws."
    ]
    zone_id = "Z071299925RUGS0OOY5Y9"
}

resource "aws_route53_record" "Route53RecordSet5" {
    name = "applicant.hyobeom.shop."
    type = "A"
    alias {
        name = "dualstack.weplat-ap2-was-alb-1562968229.ap-northeast-2.elb.amazonaws.com."
        zone_id = "ZWKZPGTI48KDX"
        evaluate_target_health = true
    }
    zone_id = "Z071299925RUGS0OOY5Y9"
}

resource "aws_route53_record" "Route53RecordSet6" {
    name = "grafana.hyobeom.shop."
    type = "A"
    alias {
        name = "dualstack.weplat-ap2-web-alb-1356917930.ap-northeast-2.elb.amazonaws.com."
        zone_id = "ZWKZPGTI48KDX"
        evaluate_target_health = true
    }
    zone_id = "Z071299925RUGS0OOY5Y9"
}

resource "aws_route53_record" "Route53RecordSet7" {
    name = "jobposting.hyobeom.shop."
    type = "A"
    alias {
        name = "dualstack.weplat-ap2-was-alb-1562968229.ap-northeast-2.elb.amazonaws.com."
        zone_id = "ZWKZPGTI48KDX"
        evaluate_target_health = true
    }
    zone_id = "Z071299925RUGS0OOY5Y9"
}

resource "aws_route53_record" "Route53RecordSet8" {
    name = "zabbix.hyobeom.shop."
    type = "A"
    alias {
        name = "dualstack.weplat-ap2-web-alb-1356917930.ap-northeast-2.elb.amazonaws.com."
        zone_id = "ZWKZPGTI48KDX"
        evaluate_target_health = true
    }
    zone_id = "Z071299925RUGS0OOY5Y9"
}

resource "aws_instance" "EC2Instance" {
    ami = "ami-0432815cad43e4bd1"
    instance_type = "t3.medium"
    key_name = "weplat-key"
    availability_zone = "ap-northeast-2c"
    tenancy = "default"
    subnet_id = "subnet-00e443ca60f9ca813"
    ebs_optimized = true
    vpc_security_group_ids = [
        "${aws_security_group.EC2SecurityGroup4.id}"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 8
        volume_type = "gp2"
        delete_on_termination = true
    }
    tags = {
        Name = "weplat-ap2-Bastion"
    }
}

resource "aws_instance" "EC2Instance2" {
    ami = "ami-09a7535106fbd42d5"
    instance_type = "t3.large"
    key_name = "weplat-key"
    availability_zone = "ap-northeast-2c"
    tenancy = "default"
    subnet_id = "subnet-02b9a0f2363eba094"
    ebs_optimized = true
    vpc_security_group_ids = [
        "${aws_security_group.EC2SecurityGroup6.id}"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 20
        volume_type = "gp3"
        delete_on_termination = true
    }
    tags = {
        Name = "weplat-ap2-monitoring"
    }
}

resource "aws_lb" "ElasticLoadBalancingV2LoadBalancer" {
    name = "weplat-ap2-web-alb"
    internal = false
    load_balancer_type = "application"
    subnets = [
        "subnet-003d5ab23920809cf",
        "subnet-00e443ca60f9ca813"
    ]
    security_groups = [
        "${aws_security_group.EC2SecurityGroup.id}"
    ]
    ip_address_type = "ipv4"
    access_logs {
        enabled = false
        bucket = ""
        prefix = ""
    }
    idle_timeout = "60"
    enable_deletion_protection = "false"
    enable_http2 = "true"
    enable_cross_zone_load_balancing = "true"
}

resource "aws_lb" "ElasticLoadBalancingV2LoadBalancer2" {
    name = "weplat-ap2-was-alb"
    internal = false
    load_balancer_type = "application"
    subnets = [
        "subnet-003d5ab23920809cf",
        "subnet-00e443ca60f9ca813"
    ]
    security_groups = [
        "${aws_security_group.EC2SecurityGroup2.id}"
    ]
    ip_address_type = "ipv4"
    access_logs {
        enabled = false
        bucket = ""
        prefix = ""
    }
    idle_timeout = "60"
    enable_deletion_protection = "false"
    enable_http2 = "true"
    enable_cross_zone_load_balancing = "true"
}

resource "aws_lb_listener" "ElasticLoadBalancingV2Listener" {
    load_balancer_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:loadbalancer/app/weplat-ap2-web-alb/597b5e6d3ed099be"
    port = 443
    protocol = "HTTPS"
    ssl_policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"
    certificate_arn = "arn:aws:acm:ap-northeast-2:639122009176:certificate/8f4359be-ad9b-424d-90ad-13d4342e79a2"
    default_action {
        target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-web-alb-tg/339882263fbbab8b"
        type = "forward"
    }
}

resource "aws_lb_listener" "ElasticLoadBalancingV2Listener2" {
    load_balancer_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:loadbalancer/app/weplat-ap2-web-alb/597b5e6d3ed099be"
    port = 80
    protocol = "HTTP"
    default_action {
        redirect {
            host = "#{host}"
            path = "/#{path}"
            port = "443"
            protocol = "HTTPS"
            query = "#{query}"
            status_code = "HTTP_301"
        }
        type = "redirect"
    }
}

resource "aws_lb_listener" "ElasticLoadBalancingV2Listener3" {
    load_balancer_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:loadbalancer/app/weplat-ap2-was-alb/f2ca08c9c317fe21"
    port = 443
    protocol = "HTTPS"
    ssl_policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"
    certificate_arn = "arn:aws:acm:ap-northeast-2:639122009176:certificate/8f4359be-ad9b-424d-90ad-13d4342e79a2"
    default_action {
        fixed_response {
            content_type = "text/plain"
            status_code = "503"
        }
        type = "fixed-response"
    }
}

resource "aws_lb_listener" "ElasticLoadBalancingV2Listener4" {
    load_balancer_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:loadbalancer/app/weplat-ap2-was-alb/f2ca08c9c317fe21"
    port = 80
    protocol = "HTTP"
    default_action {
        redirect {
            host = "#{host}"
            path = "/#{path}"
            port = "443"
            protocol = "HTTPS"
            query = "#{query}"
            status_code = "HTTP_301"
        }
        type = "redirect"
    }
}

resource "aws_lb_listener_rule" "ElasticLoadBalancingV2ListenerRule" {
    priority = "1"
    listener_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:listener/app/weplat-ap2-web-alb/597b5e6d3ed099be/197c16f77986f5b0"
    condition {
        host_header {
            values = [
                "zabbix.hyobeom.shop"
            ]
        }
    }
    action {
        type = "forward"
        target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-zabbix-tg/2642cd5cc42e37bd"
        forward {
            target_group{
                    arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-zabbix-tg/2642cd5cc42e37bd"
                    weight = 1
                }
        
            stickiness {
                duration = 3600
                enabled = false
            }
        }
    }
}





resource "aws_lb_listener_rule" "ElasticLoadBalancingV2ListenerRule2" {
    priority = "2"
    listener_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:listener/app/weplat-ap2-web-alb/597b5e6d3ed099be/197c16f77986f5b0"
    condition {
        host_header {
            values = [
                "grafana.hyobeom.shop"
            ]
        }
    }
    action {
        type = "forward"
        target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-grafana-tg/af46aca075eabdfa"
        forward {
            target_group {
                    arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-grafana-tg/af46aca075eabdfa"
                    weight = 1
                }
            stickiness {
                duration = 3600
                enabled = false
            }
        }
    }
}

resource "aws_lb_listener_rule" "ElasticLoadBalancingV2ListenerRule3" {
    priority = "1"
    listener_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:listener/app/weplat-ap2-was-alb/f2ca08c9c317fe21/7da3914822a4cb09"
    condition {
        host_header {
            values = [
                "applicant.hyobeom.shop"
            ]
        }
    }
    action {
        type = "forward"
        target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-was-alb-tg-8080/31b91227b37048e0"
        forward {
            target_group{
                    arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-was-alb-tg-8080/31b91227b37048e0"
                    weight = 1
                }
            stickiness {
                duration = 3600
                enabled = false
            }
        }
    }
}

resource "aws_lb_listener_rule" "ElasticLoadBalancingV2ListenerRule4" {
    priority = "2"
    listener_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:listener/app/weplat-ap2-was-alb/f2ca08c9c317fe21/7da3914822a4cb09"
    condition {
        host_header {
            values = [
                "jobposting.hyobeom.shop"
            ]
        }
    }
    action {
        type = "forward"
        target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-was-alb-tg-8888/25ee411656d9c0ad"
        forward {
            target_group{
                    arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-was-alb-tg-8888/25ee411656d9c0ad"
                    weight = 1
                }
            stickiness {
                duration = 3600
                enabled = false
            }
        }
    }
}

resource "aws_security_group" "EC2SecurityGroup" {
    description = "weplat-ap2-web-alb-sg"
    name = "weplat-ap2-web-alb-sg"
    tags = {}
    vpc_id = "${aws_vpc.EC2VPC.id}"
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 80
        protocol = "tcp"
        to_port = 80
    }
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
    }
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 3000
        protocol = "tcp"
        to_port = 3000
    }
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 443
        protocol = "tcp"
        to_port = 443
    }
    egress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }
}

resource "aws_security_group" "EC2SecurityGroup2" {
    description = "weplat-ap2-was-alb-sg"
    name = "weplat-ap2-was-alb-sg"
    tags = {}
    vpc_id = "${aws_vpc.EC2VPC.id}"
    ingress {
        cidr_blocks = [
            "211.205.9.172/32"
        ]
        from_port = 80
        protocol = "tcp"
        to_port = 80
    }
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup5.id}"
        ]
        from_port = 80
        protocol = "tcp"
        to_port = 80
    }
    ingress {
        cidr_blocks = [
            "211.205.9.172/32"
        ]
        from_port = 443
        protocol = "tcp"
        to_port = 443
    }
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup5.id}"
        ]
        from_port = 443
        protocol = "tcp"
        to_port = 443
    }
    egress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }
}

resource "aws_security_group" "EC2SecurityGroup3" {
    description = "weplat-ap2-was-sg"
    name = "weplat-ap2-was-sg"
    tags = {}
    vpc_id = "${aws_vpc.EC2VPC.id}"
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup2.id}"
        ]
        from_port = 8888
        protocol = "tcp"
        to_port = 8888
    }
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup2.id}"
        ]
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
    }
    egress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }
}

resource "aws_security_group" "EC2SecurityGroup4" {
    description = "weplat-ap2-bastion-sg"
    name = "weplat-ap2-bastion-sg"
    tags = {}
    vpc_id = "${aws_vpc.EC2VPC.id}"
    ingress {
        cidr_blocks = [
            "211.205.9.172/32"
        ]
        from_port = 22
        protocol = "tcp"
        to_port = 22
    }
    egress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }
}

resource "aws_security_group" "EC2SecurityGroup5" {
    description = "weplat-ap2-web-sg"
    name = "weplat-ap2-web-sg"
    tags = {}
    vpc_id = "${aws_vpc.EC2VPC.id}"
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup.id}"
        ]
        from_port = 80
        protocol = "tcp"
        to_port = 80
    }
    egress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }
}

resource "aws_security_group" "EC2SecurityGroup6" {
    description = "weplat-ap2-monitoring-sg"
    name = "weplat-ap2-monitoring-sg"
    tags = {}
    vpc_id = "${aws_vpc.EC2VPC.id}"
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup.id}"
        ]
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
    }
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup4.id}"
        ]
        from_port = 22
        protocol = "tcp"
        to_port = 22
    }
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup.id}"
        ]
        from_port = 3000
        protocol = "tcp"
        to_port = 3000
    }
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = -1
        protocol = "icmp"
        to_port = -1
    }
    egress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }
}

resource "aws_security_group" "EC2SecurityGroup7" {
    description = "weplat-ap2-db-sg"
    name = "weplat-ap2-db-sg"
    tags = {}
    vpc_id = "${aws_vpc.EC2VPC.id}"
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup3.id}"
        ]
        from_port = 3306
        protocol = "tcp"
        to_port = 3306
    }
    ingress {
        security_groups = [
            "${aws_security_group.EC2SecurityGroup4.id}"
        ]
        from_port = 3306
        protocol = "tcp"
        to_port = 3306
    }
    egress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }
}

resource "aws_lb_target_group" "ElasticLoadBalancingV2TargetGroup" {
    health_check {
        interval = 30
        path = "/"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 5
        unhealthy_threshold = 2
        healthy_threshold = 5
        matcher = "200"
    }
    port = 3000
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    name = "weplat-ap2-grafana-tg"
}

resource "aws_lb_target_group" "ElasticLoadBalancingV2TargetGroup2" {
    health_check {
        interval = 30
        path = "/"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 5
        unhealthy_threshold = 2
        healthy_threshold = 5
        matcher = "200"
    }
    port = 8080
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    name = "weplat-ap2-was-alb-tg-8080"
}

resource "aws_lb_target_group" "ElasticLoadBalancingV2TargetGroup3" {
    health_check {
        interval = 30
        path = "/"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 5
        unhealthy_threshold = 2
        healthy_threshold = 5
        matcher = "200"
    }
    port = 8888
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    name = "weplat-ap2-was-alb-tg-8888"
}

resource "aws_lb_target_group" "ElasticLoadBalancingV2TargetGroup4" {
    health_check {
        interval = 30
        path = "/"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 5
        unhealthy_threshold = 2
        healthy_threshold = 5
        matcher = "200"
    }
    port = 80
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    name = "weplat-ap2-web-alb-tg"
}

resource "aws_lb_target_group" "ElasticLoadBalancingV2TargetGroup5" {
    health_check {
        interval = 30
        path = "/"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 5
        unhealthy_threshold = 2
        healthy_threshold = 5
        matcher = "200"
    }
    port = 8080
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = "${aws_vpc.EC2VPC.id}"
    name = "weplat-ap2-zabbix-tg"
}

resource "aws_ebs_volume" "EC2Volume" {
    availability_zone = "ap-northeast-2c"
    encrypted = false
    size = 20
    type = "gp3"
    snapshot_id = "snap-0e43c3eefca073953"
    tags = {}
}

resource "aws_ebs_volume" "EC2Volume2" {
    availability_zone = "ap-northeast-2c"
    encrypted = false
    size = 8
    type = "gp2"
    snapshot_id = "snap-0e583a08d174a1d51"
    tags = {}
}

resource "aws_volume_attachment" "EC2VolumeAttachment" {
    volume_id = "vol-07a08bb5c4c2c51a0"
    instance_id = "i-04234f3722e44ae06"
    device_name = "/dev/sda1"
}

resource "aws_volume_attachment" "EC2VolumeAttachment2" {
    volume_id = "vol-037893f1d3cde13d0"
    instance_id = "i-01c71d3b0aaedd036"
    device_name = "/dev/xvda"
}

resource "aws_network_interface" "EC2NetworkInterface" {
    description = "arn:aws:ecs:ap-northeast-2:639122009176:attachment/a0589284-42a8-457c-a98a-0ed27c4dfb52"
    private_ips = [
        "10.0.4.239"
    ]
    subnet_id = "subnet-0a4de8d0892330ae6"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup3.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface2" {
    description = "arn:aws:ecs:ap-northeast-2:639122009176:attachment/71caa17a-0f3f-428b-86a0-e0931c77f364"
    private_ips = [
        "10.0.4.197"
    ]
    subnet_id = "subnet-0a4de8d0892330ae6"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup3.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface3" {
    description = "RDSNetworkInterface"
    private_ips = [
        "10.0.8.124"
    ]
    subnet_id = "subnet-02b1be9edb3d7576f"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup7.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface4" {
    description = "arn:aws:ecs:ap-northeast-2:639122009176:attachment/ce6168cb-769c-4019-8c31-6071cde6b20d"
    private_ips = [
        "10.0.4.198"
    ]
    subnet_id = "subnet-0a4de8d0892330ae6"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup5.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface5" {
    description = "ELB app/weplat-ap2-was-alb/f2ca08c9c317fe21"
    private_ips = [
        "10.0.0.209"
    ]
    subnet_id = "subnet-003d5ab23920809cf"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup2.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface6" {
    description = "ELB app/weplat-ap2-web-alb/597b5e6d3ed099be"
    private_ips = [
        "10.0.0.108"
    ]
    subnet_id = "subnet-003d5ab23920809cf"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface7" {
    description = "ELB app/weplat-ap2-was-alb/f2ca08c9c317fe21"
    private_ips = [
        "10.0.2.189"
    ]
    subnet_id = "subnet-00e443ca60f9ca813"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup2.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface8" {
    description = "arn:aws:ecs:ap-northeast-2:639122009176:attachment/7c061abd-27a7-41dc-874f-643dcf40b102"
    private_ips = [
        "10.0.6.78"
    ]
    subnet_id = "subnet-02b9a0f2363eba094"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup5.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface9" {
    description = "Interface for NAT Gateway nat-07e9bc7dd67adbb83"
    private_ips = [
        "10.0.2.203"
    ]
    subnet_id = "subnet-00e443ca60f9ca813"
    source_dest_check = false
}

resource "aws_network_interface" "EC2NetworkInterface10" {
    description = "arn:aws:ecs:ap-northeast-2:639122009176:attachment/ee367929-5997-459b-a9a2-cf0730ff8c55"
    private_ips = [
        "10.0.6.245"
    ]
    subnet_id = "subnet-02b9a0f2363eba094"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup3.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface11" {
    description = ""
    private_ips = [
        "10.0.6.140"
    ]
    subnet_id = "subnet-02b9a0f2363eba094"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup6.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface12" {
    description = "arn:aws:ecs:ap-northeast-2:639122009176:attachment/6da2f4a2-1316-43a9-9b42-20a247565ef0"
    private_ips = [
        "10.0.6.159"
    ]
    subnet_id = "subnet-02b9a0f2363eba094"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup3.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface13" {
    description = ""
    private_ips = [
        "10.0.2.160"
    ]
    subnet_id = "subnet-00e443ca60f9ca813"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup4.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface14" {
    description = "ELB app/weplat-ap2-web-alb/597b5e6d3ed099be"
    private_ips = [
        "10.0.2.150"
    ]
    subnet_id = "subnet-00e443ca60f9ca813"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup.id}"
    ]
}

resource "aws_network_interface" "EC2NetworkInterface15" {
    description = "RDSNetworkInterface"
    private_ips = [
        "10.0.10.66"
    ]
    subnet_id = "subnet-01d2227114d4ef3a8"
    source_dest_check = true
    security_groups = [
        "${aws_security_group.EC2SecurityGroup7.id}"
    ]
}

resource "aws_network_interface_attachment" "EC2NetworkInterfaceAttachment" {
    network_interface_id = "eni-079f8d50919ba3147"
    device_index = 0
    instance_id = "i-04234f3722e44ae06"
}

resource "aws_network_interface_attachment" "EC2NetworkInterfaceAttachment2" {
    network_interface_id = "eni-0a8b33bd18edb5b56"
    device_index = 0
    instance_id = "i-01c71d3b0aaedd036"
}

resource "aws_key_pair" "EC2KeyPair2" {
    public_key = "REPLACEME"
    key_name = "weplat-key"
}

resource "aws_db_instance" "RDSDBInstance" {
    identifier = "weplat-ap2-rds"
    allocated_storage = 20
    instance_class = "db.t3.medium"
    engine = "mysql"
    username = "weplat"
    password = "REPLACEME"
    backup_window = "17:14-17:44"
    backup_retention_period = 7
    availability_zone = "ap-northeast-2c"
    maintenance_window = "sat:19:40-sat:20:10"
    multi_az = true
    engine_version = "8.0.35"
    auto_minor_version_upgrade = false
    license_model = "general-public-license"
    iops = 3000
    publicly_accessible = false
    storage_type = "gp3"
    port = 3306
    storage_encrypted = true
    kms_key_id = "arn:aws:kms:ap-northeast-2:639122009176:key/15aaf4d5-28b8-4339-94a8-f983b802a48f"
    copy_tags_to_snapshot = true
    monitoring_interval = 60
    iam_database_authentication_enabled = false
    deletion_protection = true
    db_subnet_group_name = "weplat-ap2-db-subnet-group"
    vpc_security_group_ids = [
        "${aws_security_group.EC2SecurityGroup7.id}"
    ]
}

resource "aws_db_subnet_group" "RDSDBSubnetGroup" {
    description = "weplat-ap2-db-subnet-group"
    name = "weplat-ap2-db-subnet-group"
    subnet_ids = [
        "subnet-02b1be9edb3d7576f",
        "subnet-01d2227114d4ef3a8"
    ]
}

resource "aws_ecr_repository" "ECRRepository" {
    name = "weplat-backend"
}

resource "aws_ecr_repository" "ECRRepository2" {
    name = "weplat-frontend"
}

resource "aws_ecs_cluster" "ECSCluster" {
    name = "weplat-ap2-ecs-cluster"
}

resource "aws_ecs_service" "ECSService" {
    name = "weplat-ap2-ecs-back-job-service"
    cluster = "arn:aws:ecs:ap-northeast-2:639122009176:cluster/weplat-ap2-ecs-cluster"
    load_balancer {
        target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-was-alb-tg-8888/25ee411656d9c0ad"
        container_name = "weplat-back-jobposting"
        container_port = 8888
    }
    desired_count = 2
    platform_version = "LATEST"
    task_definition = "${aws_ecs_task_definition.ECSTaskDefinition2.arn}"
    deployment_maximum_percent = 200
    deployment_minimum_healthy_percent = 100
    iam_role = "arn:aws:iam::639122009176:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
    network_configuration {
        assign_public_ip = "DISABLED"
        security_groups = [
            "${aws_security_group.EC2SecurityGroup3.id}"
        ]
        subnets = [
            "subnet-0a4de8d0892330ae6",
            "subnet-02b9a0f2363eba094"
        ]
    }
    health_check_grace_period_seconds = 30
    scheduling_strategy = "REPLICA"
}

resource "aws_ecs_service" "ECSService2" {
    name = "weplat-ap2-ecs-front-service"
    cluster = "arn:aws:ecs:ap-northeast-2:639122009176:cluster/weplat-ap2-ecs-cluster"
    load_balancer {
        target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-web-alb-tg/339882263fbbab8b"
        container_name = "weplat-front"
        container_port = 80
    }
    desired_count = 2
    platform_version = "LATEST"
    task_definition = "${aws_ecs_task_definition.ECSTaskDefinition.arn}"
    deployment_maximum_percent = 200
    deployment_minimum_healthy_percent = 100
    iam_role = "arn:aws:iam::639122009176:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
    network_configuration {
        assign_public_ip = "DISABLED"
        security_groups = [
            "${aws_security_group.EC2SecurityGroup5.id}"
        ]
        subnets = [
            "subnet-0a4de8d0892330ae6",
            "subnet-02b9a0f2363eba094"
        ]
    }
    health_check_grace_period_seconds = 0
    scheduling_strategy = "REPLICA"
}

resource "aws_ecs_service" "ECSService3" {
    name = "weplat-ap2-ecs-back-app-service"
    cluster = "arn:aws:ecs:ap-northeast-2:639122009176:cluster/weplat-ap2-ecs-cluster"
    load_balancer {
        target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-was-alb-tg-8080/31b91227b37048e0"
        container_name = "weplat-back-applicant"
        container_port = 8080
    }
    desired_count = 2
    platform_version = "LATEST"
    task_definition = "${aws_ecs_task_definition.ECSTaskDefinition3.arn}"
    deployment_maximum_percent = 200
    deployment_minimum_healthy_percent = 100
    iam_role = "arn:aws:iam::639122009176:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
    network_configuration {
        assign_public_ip = "DISABLED"
        security_groups = [
            "${aws_security_group.EC2SecurityGroup3.id}"
        ]
        subnets = [
            "subnet-0a4de8d0892330ae6",
            "subnet-02b9a0f2363eba094"
        ]
    }
    health_check_grace_period_seconds = 30
    scheduling_strategy = "REPLICA"
}

resource "aws_ecs_task_definition" "ECSTaskDefinition" {
    container_definitions = "[{\"name\":\"weplat-front\",\"image\":\"639122009176.dkr.ecr.ap-northeast-2.amazonaws.com/weplat-frontend:web\",\"cpu\":0,\"portMappings\":[{\"containerPort\":80,\"hostPort\":80,\"protocol\":\"tcp\",\"name\":\"web-80\",\"appProtocol\":\"http\"}],\"essential\":true,\"environment\":[],\"mountPoints\":[],\"volumesFrom\":[],\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-create-group\":\"true\",\"awslogs-group\":\"/ecs/weplat-ap2-front-task-1\",\"awslogs-region\":\"ap-northeast-2\",\"awslogs-stream-prefix\":\"ecs\"}},\"systemControls\":[]}]"
    family = "weplat-ap2-front-task-1"
    execution_role_arn = "${aws_iam_role.IAMRole7.arn}"
    network_mode = "awsvpc"
    requires_compatibilities = [
        "FARGATE"
    ]
    cpu = "512"
    memory = "1024"
}

resource "aws_ecs_task_definition" "ECSTaskDefinition2" {
    container_definitions = "[{\"name\":\"weplat-back-jobposting\",\"image\":\"639122009176.dkr.ecr.ap-northeast-2.amazonaws.com/weplat-backend:jobposting\",\"cpu\":0,\"portMappings\":[{\"containerPort\":8888,\"hostPort\":8888,\"protocol\":\"tcp\",\"name\":\"jobposting-8888\",\"appProtocol\":\"http\"}],\"essential\":true,\"environment\":[],\"mountPoints\":[],\"volumesFrom\":[],\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-create-group\":\"true\",\"awslogs-group\":\"/ecs/weplat-ap2-back-job-task-1\",\"awslogs-region\":\"ap-northeast-2\",\"awslogs-stream-prefix\":\"ecs\"}},\"systemControls\":[]}]"
    family = "weplat-ap2-back-job-task-1"
    execution_role_arn = "${aws_iam_role.IAMRole7.arn}"
    network_mode = "awsvpc"
    requires_compatibilities = [
        "FARGATE"
    ]
    cpu = "512"
    memory = "1024"
}

resource "aws_ecs_task_definition" "ECSTaskDefinition3" {
    container_definitions = "[{\"name\":\"weplat-back-applicant\",\"image\":\"639122009176.dkr.ecr.ap-northeast-2.amazonaws.com/weplat-backend:applicant\",\"cpu\":0,\"portMappings\":[{\"containerPort\":8080,\"hostPort\":8080,\"protocol\":\"tcp\",\"name\":\"applicant-8080\",\"appProtocol\":\"http\"}],\"essential\":true,\"environment\":[],\"mountPoints\":[],\"volumesFrom\":[],\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-create-group\":\"true\",\"awslogs-group\":\"/ecs/weplat-ap2-back-app-task-1\",\"awslogs-region\":\"ap-northeast-2\",\"awslogs-stream-prefix\":\"ecs\"}},\"systemControls\":[]}]"
    family = "weplat-ap2-back-app-task-1"
    execution_role_arn = "${aws_iam_role.IAMRole7.arn}"
    network_mode = "awsvpc"
    requires_compatibilities = [
        "FARGATE"
    ]
    cpu = "512"
    memory = "1024"
}

resource "aws_acm_certificate" "CertificateManagerCertificate" {
    domain_name = "hyobeom.shop"
    subject_alternative_names = [
        "hyobeom.shop",
        "*.hyobeom.shop"
    ]
    validation_method = "DNS"
}

resource "aws_service_discovery_http_namespace" "ServiceDiscoveryHttpNamespace2" {
    name = "weplat-ap2-ecs-cluster"
}