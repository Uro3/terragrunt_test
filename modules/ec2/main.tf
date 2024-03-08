data "aws_ssm_parameter" "amazonlinux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"
}

resource "aws_iam_role" "app" {
  name = "${var.name_prefix}-app-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "app" {
  name = "${var.name_prefix}-app-profile"
  role = aws_iam_role.app.name
}

resource "aws_instance" "app" {
  ami                  = data.aws_ssm_parameter.amazonlinux_2023.value
  instance_type        = "t2.micro"
  subnet_id            = var.subnet_id
  iam_instance_profile = aws_iam_instance_profile.app.name

  tags = {
    Name = "${var.name_prefix}-app"
  }
}
