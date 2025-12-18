variable "project_name" {
    type = string
    description = "Project Name"
}
variable "vpc_cidr" {
    type = string
    description = "CIDR block for the VPC"
}
variable "public_subnet_az1_cidr" {
    type = string
    description = "CIDR block for the public subnet in availability zone 1"
}
variable "public_subnet_az2_cidr" {
    type = string
    description = "CIDR block for the public subnet in availability zone 2"
}
variable "private_subnet_az1_cidr" {
    type = string
    description = "CIDR block for the private subnet in availability zone 1"
}
variable "private_subnet_az2_cidr" {
    type = string
    description = "CIDR block for the private subnet in availability zone 2"
}
