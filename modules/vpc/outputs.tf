output "public_subnet_id" {
  description = "パブリックサブネットのID"
  value       = aws_subnet.public.id
}

output "route_table_id_map" {
  description = "ルートテーブルID"
  value = {
    public   = aws_route_table.public.id
    private  = aws_route_table.private.id
  }
}

output "security_group_id_map" {
  description = "セキュリティグループID"
  value = {
    public_web = aws_security_group.public_web.id
  }
}
