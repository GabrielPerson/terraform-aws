#create vpc
resource "aws_vpc" "vpc" {
    cidr_block                  = var.vpc_cidr 
    instance_tenancy            = "default"
    enable_dns_hostnames        = true
    enable_dns_support          = true

    tags = {
        Name                    = "${var.project_name}-vpc"
    }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id                        = aws_vpc.vpc.id

  tags = {
    Name                        = "${var.project_name}-igw"
  }
}

# create NAT gateway and attach it to vpc
#resource "aws_nat_gateway" "nat_gateway" {
#
#    availability_mode = "regional"
#    connectivity_type = "public"
#    vpc_id = aws_vpc.vpc.id
#    
#
#    tags = {
#        Name    = "${var.project_name}-natgw"
#    }
#}

# use data source to get list of all availability zones
# Declare the data source
data "aws_availability_zones" "availability_zones" {}

# create public subnet az1
resource "aws_subnet" "public_subnet_az1" {
    vpc_id                     = aws_vpc.vpc.id
    cidr_block                 = var.public_subnet_az1_cidr
    availability_zone          = "us-east-1a"
    map_public_ip_on_launch    = true
    tags = {
        Name = "${var.project_name}-pbsubnet az1"
    }
}

# create public_subnet_az2
resource "aws_subnet" "public_subnet_az2" {
    vpc_id                     = aws_vpc.vpc.id
    cidr_block                 = var.public_subnet_az2_cidr
    availability_zone          = "us-east-1b"
    map_public_ip_on_launch    = true
    tags = {
        Name = "${var.project_name}-pbsubnet az2"
    }
}

# create route table 1 and add public route
resource "aws_route_table" "public_route_table1" {
  vpc_id                     = aws_vpc.vpc.id

  route {
    cidr_block               = "0.0.0.0/0"
    gateway_id               = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name                     = "${var.project_name}-pbrtb az1"
  }
}

# create route table 2 and add public route
resource "aws_route_table" "public_route_table2" {
  vpc_id                     = aws_vpc.vpc.id

  route {
    cidr_block               = "0.0.0.0/0"
    gateway_id               = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name                     = "${var.project_name}-pbrtb az2"
  }
}

# associate public subnet az1 with the public route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id                  = aws_subnet.public_subnet_az1.id
  route_table_id             = aws_route_table.public_route_table1.id
}

# associate publi subnet az2 with pulic subnet az2
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id                  = aws_subnet.public_subnet_az2.id
  route_table_id             = aws_route_table.public_route_table2.id
}

# create private subnet az1
resource "aws_subnet" "private_subnet_az1" {
    vpc_id                     = aws_vpc.vpc.id
    cidr_block                 = var.private_subnet_az1_cidr
    availability_zone          = "us-east-1a"
    map_public_ip_on_launch    = true
    tags = {
        Name = "${var.project_name}-pvsubnet az1"
    }
}

# create private subnet az2
resource "aws_subnet" "private_subnet_az2" {
    vpc_id                     = aws_vpc.vpc.id
    cidr_block                 = var.private_subnet_az2_cidr
    availability_zone          = "us-east-1b"
    map_public_ip_on_launch    = true
    tags = {
        Name = "${var.project_name}-pvsubnet az1"
    }
}

# create pivate route table 1 and add route
resource "aws_route_table" "private_route_table1" {
  vpc_id                     = aws_vpc.vpc.id

  #route {
  #  cidr_block               = "0.0.0.0/0"
  #  gateway_id               = aws_nat_gateway.nat_gateway.id
  #}

  tags = {
    Name                     = "${var.project_name}-pvrtb az1"
  }
}

# create route table 2 and add public route
resource "aws_route_table" "private_route_table2" {
  vpc_id                     = aws_vpc.vpc.id

  #route {
  #  cidr_block               = "0.0.0.0/0"
  #  gateway_id               = aws_nat_gateway.nat_gateway.id
  #}

  tags = {
    Name                     = "${var.project_name}-pvrtb az2"
  }
}

# associate public subnet az1 with the public route table
resource "aws_route_table_association" "private_subnet_az1_route_table_association" {
  subnet_id                  = aws_subnet.private_subnet_az1.id
  route_table_id             = aws_route_table.private_route_table1.id
}

# associate publi subnet az2 with pulic subnet az2
resource "aws_route_table_association" "private_subnet_az2_route_table_association" {
  subnet_id                  = aws_subnet.private_subnet_az2.id
  route_table_id             = aws_route_table.private_route_table2.id
}