#### provider Variables defined #######
variable "region" {
  type        = string
  default     = "us-east-1"
}

##### VPC Variables defined #######

variable "vpc_name" {
  type        = string
  description = "VPC for the Prophius Assesment"
}
variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the Prophius VPC"
  default     = ["20.0.4.0/24", "20.0.5.0/24", "20.0.6.0/24"]
}
variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnets inside the Prophius VPC"
  default     = ["20.0.1.0/24", "20.0.2.0/24", "20.0.3.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "A list of availability zones specified as argument to this module"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = "false"
}
variable "enable_vpn_gateway" {
  type        = bool
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = "false"
}

variable "one_nat_gateway_per_az" {
  type        = bool
  description = "Should be true if you want only one NAT Gateway per availability zone"
  default     = "false"
}
variable "enable_dns_hostnames" {
  type        = bool
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = "true"
}
variable "enable_dns_support" {
  type        = bool
  description = "Should be true to enable DNS support in the VPC"
  default     = "true"
}
variable "vpc_tags" {
  type = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}


##### EkS Cluster Variables defined #######
variable "cluster_name" {
  type        = string
  description = "Demo Cluster for the Assesment"
  default     = "demo-cluster"
}

variable "cluster_endpoint_private_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  default     = "true"
}
variable "cluster_endpoint_public_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  default     = "false"
}
variable "enable_irsa" {
  type        = bool
  description = "To determines whether to create an OpenID Connect Provider for EKS to enable IRSA"
  default     = "true"
}
variable "eks_tags" {
  type = map(string)
  default = {
    Environment = "dev"
  }
}
