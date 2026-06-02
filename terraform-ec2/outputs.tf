output "instance_id" {
  description = "EC2 instance ID."
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "EC2 public IP address."
  value       = aws_instance.app.public_ip
}

output "public_dns" {
  description = "EC2 public DNS name."
  value       = aws_instance.app.public_dns
}

output "ssh_command" {
  description = "SSH command for the EC2 instance."
  value       = "ssh -i <your-key.pem> ubuntu@${aws_instance.app.public_ip}"
}

output "app_url" {
  description = "App URL after you deploy Docker Compose on the instance."
  value       = "http://${aws_instance.app.public_ip}:${var.app_port}"
}
