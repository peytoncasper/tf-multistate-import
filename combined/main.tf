resource "aws_iam_user" "user" {
  name = var.name
  path = var.path
}

resource "google_service_account" "sa" {
  account_id   = var.account_id
  display_name = var.display_name
}
