## [네트워크]
## vpc, subnet,  igw, nat, rt    >> main.tf
## sg            >> sg.tf

## [compute]
## alb, ec2            >> ec2.tf
## rds            >> rds.tf 
## --
## r53,acm,lb리스너
## --
## [container]
## ecs, ecr            >> ecs.tf
## --
## iam,엑세스키
## --

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
    gateway_id = "${aws_internet_gateway.EC2InternetGateway.id}"
    route_table_id = "${aws_route_table.EC2RouteTable.id}"
}

resource "aws_route" "EC2Route2" {
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.EC2NatGateway.id}"
    route_table_id = "${aws_route_table.EC2RouteTable4.id}"
}

resource "aws_eip" "EC2EIP" {
    vpc = true
}


resource "aws_nat_gateway" "EC2NatGateway" {
    subnet_id = "${aws_subnet.EC2Subnet5.id}"
    tags = {
        Name = "weplat-ap2-nat"
    }
    allocation_id = "${aws_eip.EC2EIP.id}"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation" {
    route_table_id = "${aws_route_table.EC2RouteTable.id}"
    subnet_id = "${aws_subnet.EC2Subnet5.id}"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation2" {
    route_table_id = "${aws_route_table.EC2RouteTable.id}"
    subnet_id = "${aws_subnet.EC2Subnet3.id}"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation3" {
    route_table_id = "${aws_route_table.EC2RouteTable4.id}"
    subnet_id = "${aws_subnet.EC2Subnet2.id}"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation4" {
    route_table_id = "${aws_route_table.EC2RouteTable4.id}"
    subnet_id = "${aws_subnet.EC2Subnet4.id}"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation5" {
    route_table_id = "${aws_route_table.EC2RouteTable2.id}"
    subnet_id = "${aws_subnet.EC2Subnet.id}"
}

resource "aws_route_table_association" "EC2SubnetRouteTableAssociation6" {
    route_table_id = "${aws_route_table.EC2RouteTable2.id}"
    subnet_id = "${aws_subnet.EC2Subnet6.id}"
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

resource "aws_key_pair" "EC2KeyPair2" {
    public_key = file("./id_rsa.pub")
    key_name = "weplat-key"
}

resource "aws_instance" "EC2Instance" {
    ami = "ami-0432815cad43e4bd1"
    instance_type = "t3.medium"
    key_name = "weplat-key"
    availability_zone = "ap-northeast-2c"
    tenancy = "default"
    subnet_id = "${aws_subnet.EC2Subnet3.id}"
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


resource "aws_lb" "ElasticLoadBalancingV2LoadBalancer" {
    name = "weplat-ap2-web-alb"
    internal = false
    load_balancer_type = "application"
    subnets = [
        "${aws_subnet.EC2Subnet3.id}",
        "${aws_subnet.EC2Subnet5.id}"
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
        "${aws_subnet.EC2Subnet3.id}",
        "${aws_subnet.EC2Subnet5.id}"
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

resource "aws_lb_listener" "ElasticLoadBalancingV2Listener2" {
    load_balancer_arn = aws_lb.ElasticLoadBalancingV2LoadBalancer.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.ElasticLoadBalancingV2TargetGroup4.arn
    }
}


resource "aws_lb_listener" "ElasticLoadBalancingV2Listener4" {
    load_balancer_arn = aws_lb.ElasticLoadBalancingV2LoadBalancer2.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.ElasticLoadBalancingV2TargetGroup2.arn
    }
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

resource "aws_db_subnet_group" "RDSDBSubnetGroup" {
    description = "weplat-ap2-db-subnet-group"
    name = "weplat-ap2-db-subnet-group"
    subnet_ids = [
        "${aws_subnet.EC2Subnet.id}",
        "${aws_subnet.EC2Subnet6.id}"
    ]
}

resource "aws_db_instance" "RDSDBInstance" {
    identifier = "weplat-ap2-rds"
    allocated_storage = 20
    instance_class = "db.t3.medium"
    engine = "mysql"
    username = "weplat"
    password = "weplatweplat"
    backup_window = "17:14-17:44"
    backup_retention_period = 7
    maintenance_window = "sat:19:40-sat:20:10"
    multi_az = true
    engine_version = "8.0.35"
    auto_minor_version_upgrade = false
    license_model = "general-public-license"
    publicly_accessible = false
    storage_type = "gp3"
    port = 3306
    storage_encrypted = true
    copy_tags_to_snapshot = true
    skip_final_snapshot = true
    iam_database_authentication_enabled = false
    db_subnet_group_name = "${aws_db_subnet_group.RDSDBSubnetGroup.name}"
    vpc_security_group_ids = [
        "${aws_security_group.EC2SecurityGroup7.id}"
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
        target_group_arn = aws_lb_target_group.ElasticLoadBalancingV2TargetGroup3.arn
        container_name = "weplat-back-jobposting"
        container_port = 8888
    }
    desired_count = 2
    launch_type = "FARGATE"
    platform_version = "LATEST"
    task_definition = "${aws_ecs_task_definition.ECSTaskDefinition2.arn}"
    deployment_maximum_percent = 200
    deployment_minimum_healthy_percent = 100
    network_configuration {
        assign_public_ip = "false"
        security_groups = [
            "${aws_security_group.EC2SecurityGroup3.id}"
        ]
        subnets = [
            "${aws_subnet.EC2Subnet2.id}",
            "${aws_subnet.EC2Subnet4.id}"
        ]
    }
    health_check_grace_period_seconds = 30
}

resource "aws_ecs_service" "ECSService2" {
    name = "weplat-ap2-ecs-front-service"
    cluster = "arn:aws:ecs:ap-northeast-2:639122009176:cluster/weplat-ap2-ecs-cluster"
    load_balancer {
        target_group_arn = aws_lb_target_group.ElasticLoadBalancingV2TargetGroup4.arn
        container_name = "weplat-front"
        container_port = 80
    }
    desired_count = 2
    launch_type = "FARGATE"
    platform_version = "LATEST"
    task_definition = "${aws_ecs_task_definition.ECSTaskDefinition.arn}"
    deployment_maximum_percent = 200
    deployment_minimum_healthy_percent = 100
    network_configuration {
        assign_public_ip = "false"
        security_groups = [
            "${aws_security_group.EC2SecurityGroup5.id}"
        ]
        subnets = [
            "${aws_subnet.EC2Subnet2.id}",
            "${aws_subnet.EC2Subnet4.id}"
        ]
    }
    health_check_grace_period_seconds = 0
}

resource "aws_ecs_service" "ECSService3" {
    name = "weplat-ap2-ecs-back-app-service"
    cluster = "arn:aws:ecs:ap-northeast-2:639122009176:cluster/weplat-ap2-ecs-cluster"
    load_balancer {
        target_group_arn = aws_lb_target_group.ElasticLoadBalancingV2TargetGroup2.arn
        container_name = "weplat-back-applicant"
        container_port = 8080
    }
    desired_count = 2
    launch_type = "FARGATE"
    platform_version = "LATEST"
    task_definition = "${aws_ecs_task_definition.ECSTaskDefinition3.arn}"
    deployment_maximum_percent = 200
    deployment_minimum_healthy_percent = 100
    network_configuration {
        assign_public_ip = "false"
        security_groups = [
            "${aws_security_group.EC2SecurityGroup3.id}"
        ]
        subnets = [
            "${aws_subnet.EC2Subnet2.id}",
            "${aws_subnet.EC2Subnet4.id}"
        ]
    }
    health_check_grace_period_seconds = 30
}

resource "aws_ecs_task_definition" "ECSTaskDefinition" {
    container_definitions = "[{\"name\":\"weplat-front\",\"image\":\"639122009176.dkr.ecr.ap-northeast-2.amazonaws.com/weplat-frontend:web\",\"cpu\":0,\"portMappings\":[{\"containerPort\":80,\"hostPort\":80,\"protocol\":\"tcp\",\"name\":\"web-80\",\"appProtocol\":\"http\"}],\"essential\":true,\"environment\":[],\"mountPoints\":[],\"volumesFrom\":[],\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-create-group\":\"true\",\"awslogs-group\":\"/ecs/weplat-ap2-front-task-1\",\"awslogs-region\":\"ap-northeast-2\",\"awslogs-stream-prefix\":\"ecs\"}},\"systemControls\":[]}]"
    family = "weplat-ap2-front-task-1"
    execution_role_arn = "arn:aws:iam::639122009176:role/ecsTaskExecutionRole"
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
    execution_role_arn = "arn:aws:iam::639122009176:role/ecsTaskExecutionRole"
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
    execution_role_arn = "arn:aws:iam::639122009176:role/ecsTaskExecutionRole"
    network_mode = "awsvpc"
    requires_compatibilities = [
        "FARGATE"
    ]
    cpu = "512"
    memory = "1024"
}