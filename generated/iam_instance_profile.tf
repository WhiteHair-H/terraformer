resource "aws_iam_instance_profile" "tfer--AWSCloud9SSMInstanceProfile" {
  name = "AWSCloud9SSMInstanceProfile"
  path = "/cloud9/"
  role = "AWSCloud9SSMAccessRole"
}

resource "aws_iam_instance_profile" "tfer--CloudWatchAgentServerRole" {
  name = "CloudWatchAgentServerRole"
  path = "/"
  role = "CloudWatchAgentServerRole"
}
