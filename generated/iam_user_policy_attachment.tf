resource "aws_iam_user_policy_attachment" "tfer--weplat-github-actions-user_AmazonECS_FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
  user       = "weplat-github-actions-user"
}

resource "aws_iam_user_policy_attachment" "tfer--weplat-github-actions-user_ECR_FullAccess_Policy" {
  policy_arn = "arn:aws:iam::639122009176:policy/ECR_FullAccess_Policy"
  user       = "weplat-github-actions-user"
}

resource "aws_iam_user_policy_attachment" "tfer--weplat-monitoring-user_CloudWatchFullAccessV2" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccessV2"
  user       = "weplat-monitoring-user"
}

resource "aws_iam_user_policy_attachment" "tfer--weplat_btc_user1_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = "weplat_btc_user1"
}

resource "aws_iam_user_policy_attachment" "tfer--weplat_btc_user2_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = "weplat_btc_user2"
}

resource "aws_iam_user_policy_attachment" "tfer--weplat_btc_user3_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = "weplat_btc_user3"
}

resource "aws_iam_user_policy_attachment" "tfer--weplat_btc_user4_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = "weplat_btc_user4"
}
