output "public_subnet_id" {
  description = "パブリックサブネットのID"
  value       = aws_subnet.public.id
}

output "public_route_table_id" {
  description = "パブリックサブネット用のルートテーブルのID"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "プライベートサブネット用のルートテーブルのID"
  value       = aws_route_table.private.id
}

output "public_web_security_group_id" {
  description = "セキュリティグループID"
  value       = aws_security_group.public_web.id
}
