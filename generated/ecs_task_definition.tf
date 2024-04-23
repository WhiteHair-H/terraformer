resource "aws_ecs_task_definition" "tfer--task-definition-002F-weplat-ap2-back-app-task-1" {
  container_definitions    = "[{\"cpu\":0,\"environment\":[],\"essential\":true,\"image\":\"639122009176.dkr.ecr.ap-northeast-2.amazonaws.com/weplat-backend:applicant\",\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-create-group\":\"true\",\"awslogs-group\":\"/ecs/weplat-ap2-back-app-task-1\",\"awslogs-region\":\"ap-northeast-2\",\"awslogs-stream-prefix\":\"ecs\"}},\"mountPoints\":[],\"name\":\"weplat-back-applicant\",\"portMappings\":[{\"appProtocol\":\"http\",\"containerPort\":8080,\"hostPort\":8080,\"name\":\"applicant-8080\",\"protocol\":\"tcp\"}],\"systemControls\":[],\"volumesFrom\":[]}]"
  cpu                      = "512"
  execution_role_arn       = "arn:aws:iam::639122009176:role/ecsTaskExecutionRole"
  family                   = "weplat-ap2-back-app-task-1"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }

  track_latest = "false"
}

resource "aws_ecs_task_definition" "tfer--task-definition-002F-weplat-ap2-back-job-task-1" {
  container_definitions    = "[{\"cpu\":0,\"environment\":[],\"essential\":true,\"image\":\"639122009176.dkr.ecr.ap-northeast-2.amazonaws.com/weplat-backend:jobposting\",\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-create-group\":\"true\",\"awslogs-group\":\"/ecs/weplat-ap2-back-job-task-1\",\"awslogs-region\":\"ap-northeast-2\",\"awslogs-stream-prefix\":\"ecs\"}},\"mountPoints\":[],\"name\":\"weplat-back-jobposting\",\"portMappings\":[{\"appProtocol\":\"http\",\"containerPort\":8888,\"hostPort\":8888,\"name\":\"jobposting-8888\",\"protocol\":\"tcp\"}],\"systemControls\":[],\"volumesFrom\":[]}]"
  cpu                      = "512"
  execution_role_arn       = "arn:aws:iam::639122009176:role/ecsTaskExecutionRole"
  family                   = "weplat-ap2-back-job-task-1"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }

  track_latest = "false"
}

resource "aws_ecs_task_definition" "tfer--task-definition-002F-weplat-ap2-front-task-1" {
  container_definitions    = "[{\"cpu\":0,\"environment\":[],\"essential\":true,\"image\":\"639122009176.dkr.ecr.ap-northeast-2.amazonaws.com/weplat-frontend:web\",\"logConfiguration\":{\"logDriver\":\"awslogs\",\"options\":{\"awslogs-create-group\":\"true\",\"awslogs-group\":\"/ecs/weplat-ap2-front-task-1\",\"awslogs-region\":\"ap-northeast-2\",\"awslogs-stream-prefix\":\"ecs\"}},\"mountPoints\":[],\"name\":\"weplat-front\",\"portMappings\":[{\"appProtocol\":\"http\",\"containerPort\":80,\"hostPort\":80,\"name\":\"web-80\",\"protocol\":\"tcp\"}],\"systemControls\":[],\"volumesFrom\":[]}]"
  cpu                      = "512"
  execution_role_arn       = "arn:aws:iam::639122009176:role/ecsTaskExecutionRole"
  family                   = "weplat-ap2-front-task-1"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }

  track_latest = "false"
}
