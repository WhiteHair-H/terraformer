resource "aws_iam_user" "tfer--AIDAZJTVD5RMI7KGO3U56" {
  force_destroy = "false"
  name          = "weplat_btc_user3"
  path          = "/"

  tags = {
    AKIAZJTVD5RMBPKUWPP3 = "ecs-github_actions-access"
  }

  tags_all = {
    AKIAZJTVD5RMBPKUWPP3 = "ecs-github_actions-access"
  }
}

resource "aws_iam_user" "tfer--AIDAZJTVD5RMKFZQUHYSH" {
  force_destroy = "false"
  name          = "weplat_btc_user2"
  path          = "/"

  tags = {
    AKIAZJTVD5RMFIKRQDU3 = "zabbix-access"
    AKIAZJTVD5RMMIWVEATN = "weplat-user2"
  }

  tags_all = {
    AKIAZJTVD5RMFIKRQDU3 = "zabbix-access"
    AKIAZJTVD5RMMIWVEATN = "weplat-user2"
  }
}

resource "aws_iam_user" "tfer--AIDAZJTVD5RMMEUVCG7TQ" {
  force_destroy = "false"
  name          = "weplat_btc_user1"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDAZJTVD5RMNUSL6PDD2" {
  force_destroy = "false"
  name          = "weplat_btc_user4"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDAZJTVD5RMNXRPQTRN4" {
  force_destroy = "false"
  name          = "weplat-monitoring-user"
  path          = "/"

  tags = {
    AKIAZJTVD5RMGM5N5HUI = "weplat-zabbix-access-key"
  }

  tags_all = {
    AKIAZJTVD5RMGM5N5HUI = "weplat-zabbix-access-key"
  }
}

resource "aws_iam_user" "tfer--AIDAZJTVD5RMOLHB6I3BF" {
  force_destroy = "false"
  name          = "weplat-github-actions-user"
  path          = "/"

  tags = {
    AKIAZJTVD5RMG3WEIXNV = "weplat-git-access"
  }

  tags_all = {
    AKIAZJTVD5RMG3WEIXNV = "weplat-git-access"
  }
}
