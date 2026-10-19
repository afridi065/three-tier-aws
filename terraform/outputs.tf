output "db_endpoint" { value = aws_db_instance.main.address }
output "db_password_param" { value = aws_ssm_parameter.db_password.name }
