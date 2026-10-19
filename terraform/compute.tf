data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

resource "aws_launch_template" "app" {
  name_prefix            = "${var.project}-app-"
  image_id               = data.aws_ssm_parameter.ubuntu_ami.value
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.app.id]

  iam_instance_profile { name = aws_iam_instance_profile.app.name }

  user_data = base64encode(templatefile("${path.module}/user_data.sh.tpl", {
    region     = var.region
    param_name = aws_ssm_parameter.db_password.name
    db_host    = aws_db_instance.main.address
    repo_url   = var.repo_url
  }))
}

