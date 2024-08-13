variable "name" {
    default = "webserver"
    type = string
}

variable "ami" {
    default = ""
    type = string
}

variable "key_name" {
    default = "demo-key"
    type = string
}

variable "instance_type" {
    default = "t3.micro"
    type = string
}

### VPC vars ###

variable "vpc_name" {
  description = "name of the vpc"
  type        = string
}

variable "vpc_cidr" {
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  type        = string
}

variable "cidr_ipv4" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

variable "port" {
  description = "port for SG"
  type        = number
}

variable "ip_protocol" {
  description = "protocol for SG"
  type        = string
}


