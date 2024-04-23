resource "aws_ecs_service" "tfer--weplat-ap2-ecs-cluster_weplat-ap2-ecs-back-app-service" {
  alarms {
    enable   = "false"
    rollback = "false"
  }

  capacity_provider_strategy {
    base              = "0"
    capacity_provider = "FARGATE"
    weight            = "1"
  }

  cluster = "weplat-ap2-ecs-cluster"

  deployment_circuit_breaker {
    enable   = "true"
    rollback = "true"
  }

  deployment_controller {
    type = "ECS"
  }

  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  desired_count                      = "2"
  enable_ecs_managed_tags            = "true"
  enable_execute_command             = "false"
  health_check_grace_period_seconds  = "30"

  load_balancer {
    container_name   = "weplat-back-applicant"
    container_port   = "8080"
    target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-was-alb-tg-8080/31b91227b37048e0"
  }

  name = "weplat-ap2-ecs-back-app-service"

  network_configuration {
    assign_public_ip = "false"
    security_groups  = ["sg-02ef0ececb82b81dc"]
    subnets          = ["subnet-02b9a0f2363eba094", "subnet-0a4de8d0892330ae6"]
  }

  platform_version    = "LATEST"
  scheduling_strategy = "REPLICA"
  task_definition     = "arn:aws:ecs:ap-northeast-2:639122009176:task-definition/weplat-ap2-back-app-task-1:4"
}

resource "aws_ecs_service" "tfer--weplat-ap2-ecs-cluster_weplat-ap2-ecs-back-job-service" {
  alarms {
    enable   = "false"
    rollback = "false"
  }

  capacity_provider_strategy {
    base              = "0"
    capacity_provider = "FARGATE"
    weight            = "1"
  }

  cluster = "weplat-ap2-ecs-cluster"

  deployment_circuit_breaker {
    enable   = "true"
    rollback = "true"
  }

  deployment_controller {
    type = "ECS"
  }

  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  desired_count                      = "2"
  enable_ecs_managed_tags            = "true"
  enable_execute_command             = "false"
  health_check_grace_period_seconds  = "30"

  load_balancer {
    container_name   = "weplat-back-jobposting"
    container_port   = "8888"
    target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-was-alb-tg-8888/25ee411656d9c0ad"
  }

  name = "weplat-ap2-ecs-back-job-service"

  network_configuration {
    assign_public_ip = "false"
    security_groups  = ["sg-02ef0ececb82b81dc"]
    subnets          = ["subnet-02b9a0f2363eba094", "subnet-0a4de8d0892330ae6"]
  }

  platform_version    = "LATEST"
  scheduling_strategy = "REPLICA"
  task_definition     = "arn:aws:ecs:ap-northeast-2:639122009176:task-definition/weplat-ap2-back-job-task-1:4"
}

resource "aws_ecs_service" "tfer--weplat-ap2-ecs-cluster_weplat-ap2-ecs-front-service" {
  alarms {
    enable   = "false"
    rollback = "false"
  }

  capacity_provider_strategy {
    base              = "0"
    capacity_provider = "FARGATE"
    weight            = "1"
  }

  cluster = "weplat-ap2-ecs-cluster"

  deployment_circuit_breaker {
    enable   = "true"
    rollback = "true"
  }

  deployment_controller {
    type = "ECS"
  }

  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  desired_count                      = "2"
  enable_ecs_managed_tags            = "true"
  enable_execute_command             = "false"
  health_check_grace_period_seconds  = "0"

  load_balancer {
    container_name   = "weplat-front"
    container_port   = "80"
    target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:639122009176:targetgroup/weplat-ap2-web-alb-tg/339882263fbbab8b"
  }

  name = "weplat-ap2-ecs-front-service"

  network_configuration {
    assign_public_ip = "false"
    security_groups  = ["sg-0d4d9d2fe8559da34"]
    subnets          = ["subnet-02b9a0f2363eba094", "subnet-0a4de8d0892330ae6"]
  }

  platform_version    = "LATEST"
  scheduling_strategy = "REPLICA"
  task_definition     = "arn:aws:ecs:ap-northeast-2:639122009176:task-definition/weplat-ap2-front-task-1:6"
}
