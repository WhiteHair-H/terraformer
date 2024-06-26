resource "aws_iam_role_policy" "tfer--AWS-QuickSetup-StackSet-Local-AdministrationRole_AssumeRole-AWS-QuickSetup-StackSet-Local-ExecutionRole" {
  name = "AssumeRole-AWS-QuickSetup-StackSet-Local-ExecutionRole"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:*:iam::*:role/AWS-QuickSetup-StackSet-Local-ExecutionRole"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "AWS-QuickSetup-StackSet-Local-AdministrationRole"
}

resource "aws_iam_role_policy" "tfer--CloudWatchAgentServerRole_CloudWatchAgentPutLogsRetention" {
  name = "CloudWatchAgentPutLogsRetention"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:PutRetentionPolicy",
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "CloudWatchAgentServerRole"
}
