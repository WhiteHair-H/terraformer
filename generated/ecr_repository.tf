resource "aws_ecr_repository" "tfer--weplat-backend" {
  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = "false"
  }

  image_tag_mutability = "MUTABLE"
  name                 = "weplat-backend"
}

resource "aws_ecr_repository" "tfer--weplat-frontend" {
  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = "false"
  }

  image_tag_mutability = "MUTABLE"
  name                 = "weplat-frontend"
}
