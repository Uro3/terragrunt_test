output "public_subnet_id" {
  description = "パブリックサブネットのID"
  value       = aws_subnet.public.id
}
