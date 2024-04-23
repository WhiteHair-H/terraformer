resource "aws_ecs_cluster" "tfer--weplat-ap2-ecs-cluster" {
  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }

  name = "weplat-ap2-ecs-cluster"

  service_connect_defaults {
    namespace = "arn:aws:servicediscovery:ap-northeast-2:639122009176:namespace/ns-jupruuk32wuo3xln"
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
