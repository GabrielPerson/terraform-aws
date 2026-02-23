### AWS RDS Instance
/* resource "aws_db_instance" "myrds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.43"
  instance_class       = "db.t3.micro"
  db_name              = "cadastro_db"
  username             = "adminuser"
  password             = "Admin12345!" # Cuidado com state file!
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  db_subnet_group_name   =  aws_db_subnet_group.rds-subnet-group.name
  multi_az              = false
  publicly_accessible   = false
  tags = {
    Name    = "cadastro-rds"
    project = "webrds"
  }
}

## aws rds subnet group
resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = "rds-subnet-group"
  subnet_ids = [module.database_vpc.private_subnet_az1_id, module.database_vpc.private_subnet_az2_id]

  tags = {
    Name    = "rds-subnet-group"
    project = "webrds"
  }
} */

######################## OLD

# security group rules to allow web servers to access RDS
/* resource "aws_security_group_rule" "ingressEC2-to-RDS" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds-sg.id
  source_security_group_id = aws_security_group.publicEC2-RDS.id
  description              = "Allow web servers to access RDS"
}
resource "aws_security_group_rule" "RDS-Public-egress" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.rds-sg.id
  description              = "Allow web servers to access RDS"
}
resource "aws_instance" "webserver01" {
  ami                          = "ami-07ff62358b87c7116"
  instance_type                = "t3.micro"
  subnet_id                    = module.database_vpc.public_subnet_az1_id
  vpc_security_group_ids       = [aws_security_group.publicEC2-RDS.id]
  associate_public_ip_address  = true
  user_data = <<-EOF
  #!/bin/bash
  sudo dnf update -y
  sudo dnf install mariadb105 -y
  EOF
  tags = {
    Name    = "webserver01"
    project = "webrds"
  }
  
}
resource "aws_security_group" "publicEC2-RDS" {
    description = "allow public EC2 to access RDS in private subnet"
    name                   = "publicEC2-RDS"
    name_prefix            = null
    revoke_rules_on_delete = null
    tags = {
        Name    = "publicEC2-RDS"
        project = "webrds"
    }
    tags_all = {
        Name    = "publicEC2-RDS"
        project = "webrds"
    }
    vpc_id = module.database_vpc.vpc_id
}
# security group rules to allow ec2 to acess Rds
resource "aws_security_group_rule" "allow-ec2-to-rds" {
  type                     = "egress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.publicEC2-RDS.id
  source_security_group_id = aws_security_group.rds-sg.id
  description              = "Allow EC2 instances to access RDS"
}
resource "aws_security_group_rule" "EC2-Public-egress" {
    type                     = "egress"
    from_port                = 0
    to_port                  = 0
    protocol                 = "-1"
    cidr_blocks              = ["0.0.0.0/0"]
    security_group_id        = aws_security_group.publicEC2-RDS.id
    description              = "EC2 allow all outbound traffic"
}
resource "aws_security_group_rule" "publicEC2" {
    type                     = "ingress"
    from_port                = 0
    to_port                  = 0
    protocol                 = "-1"
    cidr_blocks              = ["0.0.0.0/0"]
    security_group_id        = aws_security_group.publicEC2-RDS.id
    description              = "Public acess to EC2 instances"
} */