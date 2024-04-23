resource "aws_iam_role_policy_attachment" "tfer--AWS-QuickSetup-StackSet-Local-ExecutionRole_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "AWS-QuickSetup-StackSet-Local-ExecutionRole"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSBackupDefaultServiceRole_AWSBackupServiceRolePolicyForBackup" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = "AWSBackupDefaultServiceRole"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSBackupDefaultServiceRole_AWSBackupServiceRolePolicyForRestores" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
  role       = "AWSBackupDefaultServiceRole"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSCloud9SSMAccessRole_AWSCloud9SSMInstanceProfile" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCloud9SSMInstanceProfile"
  role       = "AWSCloud9SSMAccessRole"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAWSCloud9_AWSCloud9ServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSCloud9ServiceRolePolicy"
  role       = "AWSServiceRoleForAWSCloud9"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAutoScaling_AutoScalingServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"
  role       = "AWSServiceRoleForAutoScaling"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForBackup_AWSBackupServiceLinkedRolePolicyForBackup" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSBackupServiceLinkedRolePolicyForBackup"
  role       = "AWSServiceRoleForBackup"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForECS_AmazonECSServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"
  role       = "AWSServiceRoleForECS"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForElasticLoadBalancing_AWSElasticLoadBalancingServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"
  role       = "AWSServiceRoleForElasticLoadBalancing"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForGlobalAccelerator_AWSGlobalAcceleratorSLRPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSGlobalAcceleratorSLRPolicy"
  role       = "AWSServiceRoleForGlobalAccelerator"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForRDS_AmazonRDSServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonRDSServiceRolePolicy"
  role       = "AWSServiceRoleForRDS"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSupport_AWSSupportServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = "AWSServiceRoleForSupport"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForTrustedAdvisor_AWSTrustedAdvisorServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = "AWSServiceRoleForTrustedAdvisor"
}

resource "aws_iam_role_policy_attachment" "tfer--Amazon_EventBridge_Scheduler_LAMBDA_2ee92f7563_Amazon-EventBridge-Scheduler-Execution-Policy-1c01d478-1423-483e-8827-53f28d9273c7" {
  policy_arn = "arn:aws:iam::639122009176:policy/service-role/Amazon-EventBridge-Scheduler-Execution-Policy-1c01d478-1423-483e-8827-53f28d9273c7"
  role       = "Amazon_EventBridge_Scheduler_LAMBDA_2ee92f7563"
}

resource "aws_iam_role_policy_attachment" "tfer--CloudWatchAgentServerRole_CloudWatchAgentServerPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = "CloudWatchAgentServerRole"
}

resource "aws_iam_role_policy_attachment" "tfer--ecsTaskExecutionRole_AmazonECSTaskExecutionRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = "ecsTaskExecutionRole"
}

resource "aws_iam_role_policy_attachment" "tfer--rds-monitoring-role_AmazonRDSEnhancedMonitoringRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = "rds-monitoring-role"
}
