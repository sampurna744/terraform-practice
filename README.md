# AWS EC2 VPC Terraform Module

Simple Terraform module to create a basic VPC with:
- 1 public subnet
- Internet Gateway
- Public route table + association

## Features
- Customizable region, CIDR, name, DNS settings
- Single public subnet with auto-assign public IP
- Internet Gateway + default route (0.0.0.0/0)