output "instance_id" {
  description = "ID de l'instance EC2"
  value       = aws_instance.ubuntu_server.id
}

output "public_ip" {
  description = "Adresse IP publique de l'instance EC2"
  value       = aws_instance.ubuntu_server.public_ip
}
