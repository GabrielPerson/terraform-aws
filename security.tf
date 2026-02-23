/* resource "aws_security_group" "PublicALB" {
  description = "Public access to ALB"
  name                   = "PublicALB"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name    = "PublicALB"
    project = "webrds"
  }
  tags_all = {
    Name    = "PublicALB"
    project = "webrds"
  }
  vpc_id = module.web_vpc.vpc_id
}

resource "aws_vpc_security_group_egress_rule" "egressALBtoEC2" {
  
  security_group_id = aws_security_group.PublicALB.id
  referenced_security_group_id = aws_security_group.EC2xALB.id
  ip_protocol = "-1"
  description = "Allow ALB to EC2 egress"
  
}

resource "aws_vpc_security_group_ingress_rule" "ingressALBhttp" {
  security_group_id = aws_security_group.PublicALB.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
  description = "Allow ALB to EC2 egress"
  
}

resource "aws_vpc_security_group_ingress_rule" "ingressALBhttps" {
  security_group_id = aws_security_group.PublicALB.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 443
  to_port = 443
  description = "Allow ALB to EC2 egress"
  
}

resource "aws_security_group" "EC2xALB" {
  description = "allow alb x ec2 private connection"
  name                   = "EC2xALB"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name    = "EC2xALB"
    project = "webrds"
  }
  tags_all = {
    Name    = "EC2xALB"
    project = "webrds"
  }
  vpc_id = module.web_vpc.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "ingressEC2fromALB" {
  
  security_group_id = aws_security_group.EC2xALB.id
  referenced_security_group_id = aws_security_group.PublicALB.id
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
  description = "Allow ALB to EC2 ingress"
  
}

resource "aws_vpc_security_group_egress_rule" "egressEC2all" {
  
  security_group_id = aws_security_group.EC2xALB.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
  description = "Allow all outbound traffic from EC2"
  
}

## aws rds security group
resource "aws_security_group" "rds-sg" {
  name        = "rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = module.database_vpc.vpc_id

  tags = {
    Name    = "rds-sg"
    project = "webrds"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingressRDSfromEC2" {
  
  security_group_id = aws_security_group.rds-sg.id
  referenced_security_group_id = aws_security_group.EC2xALB.id
  ip_protocol = "tcp"
  from_port = 3306
  to_port = 3306
  description = "Allow EC2 instances to access RDS"
  
}

resource "aws_vpc_security_group_egress_rule" "egressRDSall" {
  
  security_group_id = aws_security_group.rds-sg.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
  description = "Allow all outbound traffic from RDS"
  
} */



# __generated__ by Terraform from "sg-0ea261d1124936ba9"
#resource "aws_security_group" "PublicALB" {
#  description = "Public access to ALB"
#  egress = [{
#    cidr_blocks      = []
#    description      = ""
#    from_port        = 80
#    ipv6_cidr_blocks = []
#    prefix_list_ids  = []
#    protocol         = "tcp"
#    security_groups  = ["sg-0c61d956de1cf3c7a"]
#    self             = false
#    to_port          = 80
#  }]
#  ingress = [{
#    cidr_blocks      = ["0.0.0.0/0"]
#    description      = "Public HTTP"
#    from_port        = 80
#    ipv6_cidr_blocks = []
#    prefix_list_ids  = []
#    protocol         = "tcp"
#    security_groups  = []
#    self             = false
#    to_port          = 80
#  },
#  {
#    cidr_blocks      = ["0.0.0.0/0"]
#    description      = "Public HTTPS"
#    from_port        = 443
#    ipv6_cidr_blocks = []
#    prefix_list_ids  = []
#    protocol         = "tcp"
#    security_groups  = []
#    self             = false
#    to_port          = 443
#  }]
#  name                   = "PublicALB"
#  name_prefix            = null
#  revoke_rules_on_delete = null
#  tags = {
#    Name    = "PublicALB"
#    project = "lab01"
#  }
#  tags_all = {
#    Name    = "PublicALB"
#    project = "lab01"
#  }
#  vpc_id = "vpc-0bf4705c4dd014638"
#}
#
## __generated__ by Terraform from "sg-04610df10574feae5"
#resource "aws_security_group" "alb-to-ec2" {
#  description = "allow alb to access ec2 in private subnet"
#  egress = [{
#    cidr_blocks      = ["0.0.0.0/0"]
#    description      = ""
#    from_port        = 0
#    ipv6_cidr_blocks = []
#    prefix_list_ids  = []
#    protocol         = "-1"
#    security_groups  = []
#    self             = false
#    to_port          = 0
#  }]
#  ingress = [{
#    cidr_blocks      = []
#    description      = ""
#    from_port        = 80
#    ipv6_cidr_blocks = []
#    prefix_list_ids  = []
#    protocol         = "tcp"
#    security_groups  = ["sg-0ea261d1124936ba9"]
#    self             = false
#    to_port          = 80
#  }]
#  name                   = "alb-to-ec2"
#  name_prefix            = null
#  revoke_rules_on_delete = null
#  tags = {
#    Name    = "alb-to-ec2"
#    project = "lab01"
#  }
#  tags_all = {
#    Name    = "alb-to-ec2"
#    project = "lab01"
#  }
#  vpc_id = "vpc-0bf4705c4dd014638" 
#}
#