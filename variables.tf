variable "region" {
    description = "The AWS region to create resources in."
    type        = string
    default     = "us-east-1"
}

variable "cidr_block" {
  description = "vpc cidr block"
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "name of vpc"
  type = string
  default = "myvpc"
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  type        = bool
  default     = true
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for the subnets."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones for the subnets."
  type        = list(string)
  default     = ["us-east-1a"]
}

