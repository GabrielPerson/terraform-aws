# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "labpessoal01-subnet-public1-us-east-1a" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "us-east-1a"
  cidr_block                                     = "10.0.0.0/26"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name    = "labpessoal01-subnet-public1-us-east-1a"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-subnet-public1-us-east-1a"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}

# __generated__ by Terraform
resource "aws_subnet" "labpessoal01-subnet-public2-us-east-1b" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "us-east-1b"
  cidr_block                                     = "10.0.0.64/26"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name    = "labpessoal01-subnet-public2-us-east-1b"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-subnet-public2-us-east-1b"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}

# __generated__ by Terraform
resource "aws_subnet" "labpessoal01-subnet-private2-us-east-1b" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "us-east-1b"
  cidr_block                                     = "10.0.2.64/26"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name    = "labpessoal01-subnet-private2-us-east-1b"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-subnet-private2-us-east-1b"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}

# __generated__ by Terraform
resource "aws_subnet" "labpessoal01-subnet-private1-us-east-1a" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "us-east-1a"
  cidr_block                                     = "10.0.2.0/26"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name    = "labpessoal01-subnet-private1-us-east-1a"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-subnet-private1-us-east-1a"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}

# __generated__ by Terraform
resource "aws_vpc" "labpessoal01-vpc" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = "10.0.0.0/22"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  ipv6_cidr_block                      = null
  ipv6_cidr_block_network_border_group = null
  ipv6_ipam_pool_id                    = null
  tags = {  
    Name    = "labpessoal01-vpc"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-vpc"
    project = "lab01"
  }
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "rtb-08a13a95cd42198e7"
resource "aws_route_table" "labpessoal01-rtb-private1-us-east-1a" {
  propagating_vgws = []
  route            = []
  tags = {
    Name    = "labpessoal01-rtb-private1-us-east-1a"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-rtb-private1-us-east-1a"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}

# __generated__ by Terraform from "rtb-07f4f20fb1feb96dc"
resource "aws_route_table" "labpessoal01-rtb-private2-us-east-1b" {
  propagating_vgws = []
  route            = []
  tags = {
    Name    = "labpessoal01-rtb-private2-us-east-1b"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-rtb-private2-us-east-1b"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}

# __generated__ by Terraform from "igw-003b3198ba9467f5f"
resource "aws_internet_gateway" "labpessoal01-igw" {
  tags = {
    Name    = "labpessoal01-igw"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-igw"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}

# __generated__ by Terraform
resource "aws_route_table" "labpessoal01-rtb-public" {
  propagating_vgws = []
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-003b3198ba9467f5f"
  }

  route {
    cidr_block = "10.0.0.0/22"
    gateway_id = "local"
  }
  tags = {
    Name    = "labpessoal01-rtb-public"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-rtb-public"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}

# __generated__ by Terraform from "vpce-00ef0cc850180f6e2"
resource "aws_vpc_endpoint" "labpessoal01-vpce-s3" {
  auto_accept     = null
  ip_address_type = "ipv4"
  policy = jsonencode({
    Statement = [{
      Action    = "*"
      Effect    = "Allow"
      Principal = "*"
      Resource  = "*"
    }]
    Version = "2008-10-17"
  })
  private_dns_enabled        = false
  resource_configuration_arn = null
  route_table_ids            = ["rtb-07f4f20fb1feb96dc", "rtb-08a13a95cd42198e7"]
  security_group_ids         = []
  service_name               = "com.amazonaws.us-east-1.s3"
  service_network_arn        = null
  service_region             = "us-east-1"
  subnet_ids                 = []
  tags = {
    Name    = "labpessoal01-vpce-s3"
    project = "lab01"
  }
  tags_all = {
    Name    = "labpessoal01-vpce-s3"
    project = "lab01"
  }
  vpc_endpoint_type = "Gateway"
  vpc_id            = "vpc-0bf4705c4dd014638"
  dns_options {
    dns_record_ip_type                             = "service-defined"
    private_dns_only_for_inbound_resolver_endpoint = false
  }
}
