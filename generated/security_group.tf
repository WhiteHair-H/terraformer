resource "aws_security_group" "tfer--default_sg-0497003ab547ee551" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  name   = "default"
  vpc_id = "vpc-0c2a58035c2f90a99"
}

resource "aws_security_group" "tfer--default_sg-0b28e0cdabc16c819" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_security_group" "tfer--weplat-ap2-bastion-sg_sg-06c80bfc2e066347b" {
  description = "weplat-ap2-bastion-sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["211.205.9.172/32"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name   = "weplat-ap2-bastion-sg"
  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_security_group" "tfer--weplat-ap2-db-sg_sg-03e5981ac98b2325d" {
  description = "weplat-ap2-db-sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port       = "3306"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-bastion-sg_sg-06c80bfc2e066347b_id}", "${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-was-sg_sg-02ef0ececb82b81dc_id}"]
    self            = "false"
    to_port         = "3306"
  }

  name   = "weplat-ap2-db-sg"
  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_security_group" "tfer--weplat-ap2-monitoring-sg_sg-0ea725adb0278cb4b" {
  description = "weplat-ap2-monitoring-sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port       = "22"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-bastion-sg_sg-06c80bfc2e066347b_id}"]
    self            = "false"
    to_port         = "22"
  }

  ingress {
    from_port       = "3000"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-web-alb-sg_sg-0613d2c01466437f4_id}"]
    self            = "false"
    to_port         = "3000"
  }

  ingress {
    from_port       = "8080"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-web-alb-sg_sg-0613d2c01466437f4_id}"]
    self            = "false"
    to_port         = "8080"
  }

  name   = "weplat-ap2-monitoring-sg"
  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_security_group" "tfer--weplat-ap2-was-alb-sg_sg-0c3ec4f1e2ea4a2b8" {
  description = "weplat-ap2-was-alb-sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks     = ["211.205.9.172/32"]
    from_port       = "443"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-web-sg_sg-0d4d9d2fe8559da34_id}"]
    self            = "false"
    to_port         = "443"
  }

  ingress {
    cidr_blocks     = ["211.205.9.172/32"]
    from_port       = "80"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-web-sg_sg-0d4d9d2fe8559da34_id}"]
    self            = "false"
    to_port         = "80"
  }

  name   = "weplat-ap2-was-alb-sg"
  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_security_group" "tfer--weplat-ap2-was-sg_sg-02ef0ececb82b81dc" {
  description = "weplat-ap2-was-sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port       = "8080"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-was-alb-sg_sg-0c3ec4f1e2ea4a2b8_id}"]
    self            = "false"
    to_port         = "8080"
  }

  ingress {
    from_port       = "8888"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-was-alb-sg_sg-0c3ec4f1e2ea4a2b8_id}"]
    self            = "false"
    to_port         = "8888"
  }

  name   = "weplat-ap2-was-sg"
  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_security_group" "tfer--weplat-ap2-web-alb-sg_sg-0613d2c01466437f4" {
  description = "weplat-ap2-web-alb-sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "3000"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3000"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "8080"
    protocol    = "tcp"
    self        = "false"
    to_port     = "8080"
  }

  name   = "weplat-ap2-web-alb-sg"
  vpc_id = "vpc-0e5dffb22a77634a0"
}

resource "aws_security_group" "tfer--weplat-ap2-web-sg_sg-0d4d9d2fe8559da34" {
  description = "weplat-ap2-web-sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port       = "80"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--weplat-ap2-web-alb-sg_sg-0613d2c01466437f4_id}"]
    self            = "false"
    to_port         = "80"
  }

  name   = "weplat-ap2-web-sg"
  vpc_id = "vpc-0e5dffb22a77634a0"
}
