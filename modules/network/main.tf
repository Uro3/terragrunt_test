resource "aws_vpc" "main" {
  cidr_block                           = var.vpc_cidr_block
  enable_dns_support                   = true
  enable_dns_hostnames                 = true
  enable_network_address_usage_metrics = true

  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}
