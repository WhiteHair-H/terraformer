resource "aws_iam_access_key" "tfer--AKIAZJTVD5RMDVXCPZIT" {
  depends_on = ["aws_iam_user.tfer--AIDAZJTVD5RMMEUVCG7TQ"]
  status     = "Active"
  user       = "weplat_btc_user1"
}

resource "aws_iam_access_key" "tfer--AKIAZJTVD5RMG3WEIXNV" {
  depends_on = ["aws_iam_user.tfer--AIDAZJTVD5RMOLHB6I3BF"]
  status     = "Active"
  user       = "weplat-github-actions-user"
}

resource "aws_iam_access_key" "tfer--AKIAZJTVD5RMGM5N5HUI" {
  depends_on = ["aws_iam_user.tfer--AIDAZJTVD5RMNXRPQTRN4"]
  status     = "Active"
  user       = "weplat-monitoring-user"
}

resource "aws_iam_access_key" "tfer--AKIAZJTVD5RMMIWVEATN" {
  depends_on = ["aws_iam_user.tfer--AIDAZJTVD5RMKFZQUHYSH"]
  status     = "Active"
  user       = "weplat_btc_user2"
}
