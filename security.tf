# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0ea261d1124936ba9"
resource "aws_security_group" "PublicALB" {
  description = "Public access to ALB"
  egress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0c61d956de1cf3c7a"]
    self             = false
    to_port          = 80
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Public HTTP"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "PublicALB"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name    = "PublicALB"
    project = "lab01"
  }
  tags_all = {
    Name    = "PublicALB"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}

# __generated__ by Terraform from "sg-04610df10574feae5"
resource "aws_security_group" "alb-to-ec2" {
  description = "allow alb to access ec2 in private subnet"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0ea261d1124936ba9"]
    self             = false
    to_port          = 80
  }]
  name                   = "alb-to-ec2"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name    = "alb-to-ec2"
    project = "lab01"
  }
  tags_all = {
    Name    = "alb-to-ec2"
    project = "lab01"
  }
  vpc_id = "vpc-0bf4705c4dd014638"
}
