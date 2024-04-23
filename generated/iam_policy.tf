resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-374ff4eb-ed5c-4b1a-baf6-e3644bf00ff8" {
  name = "AWSLambdaBasicExecutionRole-374ff4eb-ed5c-4b1a-baf6-e3644bf00ff8"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-northeast-2:639122009176:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-northeast-2:639122009176:log-group:/aws/lambda/weplat_btc-ap2-CWtoS3-lambda:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-63ea3260-577a-4c3c-9b7f-43431963d33a" {
  name = "AWSLambdaBasicExecutionRole-63ea3260-577a-4c3c-9b7f-43431963d33a"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-northeast-2:639122009176:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-northeast-2:639122009176:log-group:/aws/lambda/lambda:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-8d9fe539-2328-4e1e-a3a8-fe7ea5099114" {
  name = "AWSLambdaBasicExecutionRole-8d9fe539-2328-4e1e-a3a8-fe7ea5099114"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-northeast-2:639122009176:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-northeast-2:639122009176:log-group:/aws/lambda/weplat-ap2-lambda:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-a3defffa-a95a-4424-89e3-aca53578b2cd" {
  name = "AWSLambdaBasicExecutionRole-a3defffa-a95a-4424-89e3-aca53578b2cd"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-northeast-2:639122009176:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-northeast-2:639122009176:log-group:/aws/lambda/weplat-ap2-lambda:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-abb78eda-1956-4b70-ad8e-4c28d67d57f2" {
  name = "AWSLambdaBasicExecutionRole-abb78eda-1956-4b70-ad8e-4c28d67d57f2"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-northeast-2:639122009176:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-northeast-2:639122009176:log-group:/aws/lambda/weplat-ap2-lambda:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-b01477d0-f9de-487c-9ef8-c4fe89949bb1" {
  name = "AWSLambdaBasicExecutionRole-b01477d0-f9de-487c-9ef8-c4fe89949bb1"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-northeast-2:639122009176:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-northeast-2:639122009176:log-group:/aws/lambda/weplatbtc-lambda:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-bd8624d8-07ca-4fc3-b3e4-ada959a572b5" {
  name = "AWSLambdaBasicExecutionRole-bd8624d8-07ca-4fc3-b3e4-ada959a572b5"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-northeast-2:639122009176:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-northeast-2:639122009176:log-group:/aws/lambda/subee-lambda:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-d85bcd1c-6407-49a6-8a16-1040fe3e80e0" {
  name = "AWSLambdaBasicExecutionRole-d85bcd1c-6407-49a6-8a16-1040fe3e80e0"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-northeast-2:639122009176:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-northeast-2:639122009176:log-group:/aws/lambda/weplat-lmabda:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-eaaa530c-bd47-4f5a-8bdd-10258248fd54" {
  name = "AWSLambdaBasicExecutionRole-eaaa530c-bd47-4f5a-8bdd-10258248fd54"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-northeast-2:639122009176:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:ap-northeast-2:639122009176:log-group:/aws/lambda/weplat-ap3-lambda:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--Amazon-EventBridge-Scheduler-Execution-Policy-1c01d478-1423-483e-8827-53f28d9273c7" {
  name = "Amazon-EventBridge-Scheduler-Execution-Policy-1c01d478-1423-483e-8827-53f28d9273c7"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "lambda:InvokeFunction"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:lambda:ap-northeast-2:639122009176:function:weplatbtc-lambda:*",
        "arn:aws:lambda:ap-northeast-2:639122009176:function:weplatbtc-lambda"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--ECR_FullAccess_Policy" {
  name = "ECR_FullAccess_Policy"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ecr:DescribeRepositoryCreationTemplate",
        "ecr:GetRegistryPolicy",
        "ecr:CreateRepository",
        "ecr:DescribeRegistry",
        "ecr:DescribePullThroughCacheRules",
        "ecr:GetAuthorizationToken",
        "ecr:PutRegistryScanningConfiguration",
        "ecr:CreatePullThroughCacheRule",
        "ecr:DeletePullThroughCacheRule",
        "ecr:PutRegistryPolicy",
        "ecr:GetRegistryScanningConfiguration",
        "ecr:ValidatePullThroughCacheRule",
        "ecr:CreateRepositoryCreationTemplate",
        "ecr:BatchImportUpstreamImage",
        "ecr:DeleteRepositoryCreationTemplate",
        "ecr:DeleteRegistryPolicy",
        "ecr:UpdatePullThroughCacheRule",
        "ecr:PutReplicationConfiguration"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    },
    {
      "Action": "ecr:*",
      "Effect": "Allow",
      "Resource": "arn:aws:ecr:*:639122009176:repository/*",
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
