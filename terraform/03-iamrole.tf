resource "aws_iam_role" "github_actions_role" {
  name = "GithubActionsRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com",
            "token.actions.githubusercontent.com:sub" = "repo:GenieEu/rsschool-devops-course-tasks:ref:refs/heads/task_1"
          }
        }
      }
    ]
  })

  depends_on = [aws_iam_openid_connect_provider.github_actions]
}

resource "aws_iam_role_policy_attachment" "role_policies" {
  role       = aws_iam_role.github_actions_role.name
  for_each   = toset(var.iam-role-policies)
  policy_arn = each.value
}
