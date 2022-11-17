resource "aws_iam_policy" "ssmpolicy" {
  name   = var.ssmpolicyname
  policy = file("ssmpolicy.json")
}

resource "aws_iam_role" "ssmrole" {
  name               = var.rolename
  assume_role_policy = file("ssmasumerolepolicy.json")
}

resource "aws_iam_policy_attachment" "my-policy-attach" {
  name       = "my-policy-attach"
  roles      = ["${aws_iam_role.ssmrole.name}"]
  policy_arn = aws_iam_policy.ssmpolicy.arn
}

resource "aws_iam_instance_profile" "test-profile" {
  name = "test-profile"
  role = aws_iam_role.ssmrole.name
}
