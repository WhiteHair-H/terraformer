resource "aws_iam_user_group_membership" "tfer--weplat_btc_user1-002F-weplat_btc_user_group" {
  groups = ["weplat_btc_user_group"]
  user   = "weplat_btc_user1"
}

resource "aws_iam_user_group_membership" "tfer--weplat_btc_user2-002F-weplat_btc_user_group" {
  groups = ["weplat_btc_user_group"]
  user   = "weplat_btc_user2"
}

resource "aws_iam_user_group_membership" "tfer--weplat_btc_user3-002F-weplat_btc_user_group" {
  groups = ["weplat_btc_user_group"]
  user   = "weplat_btc_user3"
}

resource "aws_iam_user_group_membership" "tfer--weplat_btc_user4-002F-weplat_btc_user_group" {
  groups = ["weplat_btc_user_group"]
  user   = "weplat_btc_user4"
}
