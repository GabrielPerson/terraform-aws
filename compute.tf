/* resource "aws_instance" "webserver01" {
  ami                          = "ami-07ff62358b87c7116"
  instance_type                = "t3.micro"
  subnet_id                    = module.web_vpc.private_subnet_az1_id
  vpc_security_group_ids       = [aws_security_group.EC2xALB.id]
  associate_public_ip_address  = false
  user_data = base64encode(templatefile(
    "${path.module}/scripts/setupweb_compact.sh", 
      {
        # 1. Lê o arquivo PHP, codifica em Base64 e passa para o script
        payload_app = base64encode(file("${path.module}/scripts/index_compact.php")),
        
        # 2. Passa os dados do Banco de Dados para o script fazer o replace
        db_address  = aws_db_instance.myrds.address
        db_username = aws_db_instance.myrds.username
        db_password = aws_db_instance.myrds.password # Cuidado com state file!
    }))
  tags = {
    Name    = "webserver01"
    project = "webrds"
  }
}

resource "aws_instance" "webserver02" {
  ami                          = "ami-07ff62358b87c7116"
  instance_type                = "t3.micro"
  subnet_id                    = module.web_vpc.private_subnet_az2_id
  vpc_security_group_ids       = [aws_security_group.EC2xALB.id]
  associate_public_ip_address  = false
  user_data = base64encode(templatefile(
    "${path.module}/scripts/setupweb_compact.sh", 
      {
        # 1. Lê o arquivo PHP, codifica em Base64 e passa para o script
        payload_app = base64encode(file("${path.module}/scripts/index_compact.php")),
        
        # 2. Passa os dados do Banco de Dados para o script fazer o replace
        db_address  = aws_db_instance.myrds.address
        db_username = aws_db_instance.myrds.username
        db_password = aws_db_instance.myrds.password # Cuidado com state file!
    }))
  tags = {
    Name    = "webserver02"
    project = "webrds"
  } 
} */



/* resource "aws_instance" "webserver_test01" {
  ami                          = "ami-07ff62358b87c7116"
  instance_type                = "t3.micro"
  subnet_id                    = module.web_vpc.private_subnet_az1_id
  vpc_security_group_ids       = [aws_security_group.EC2xALB.id]
  associate_public_ip_address  = false
  user_data = base64encode(templatefile(
    "${path.module}/scripts/test_server.sh", 
      {
        instance_name = "webserver_test01"
    }))
  tags = {
    Name    = "webserver_test01"
    project = "webrds"
  }
}

resource "aws_instance" "webserver_test02" {
  ami                          = "ami-07ff62358b87c7116"
  instance_type                = "t3.micro"
  subnet_id                    = module.web_vpc.private_subnet_az2_id
  vpc_security_group_ids       = [aws_security_group.EC2xALB.id]
  associate_public_ip_address  = false
  user_data = base64encode(templatefile(
    "${path.module}/scripts/test_server.sh", 
      {
        instance_name = "webserver_test02"
    }))
  tags = {
    Name    = "webserver_test02"
    project = "webrds"
  } 
} */



###################### OLD

  #resource "aws_instance" "lab_instancia02" {
  #  ami                                  = "ami-052064a798f08f0d3"
  #  associate_public_ip_address          = false
  #  availability_zone                    = "us-east-1b"
  #  disable_api_stop                     = false
  #  disable_api_termination              = false
  #  ebs_optimized                        = true
  #  enable_primary_ipv6                  = null
  #  get_password_data                    = false
  #  hibernation                          = false
  #  host_id                              = null
  #  host_resource_group_arn              = null
  #  iam_instance_profile                 = null
  #  instance_initiated_shutdown_behavior = "stop"
  #  instance_type                        = "t3.micro"
  #  ipv6_addresses                       = []
  #  key_name                             = null
  #  monitoring                           = false
  #  placement_group                      = null
  #  placement_partition_number           = 0
  #  private_ip                           = "10.0.2.71"
  #  secondary_private_ips                = []
  #  security_groups                      = []
  #  source_dest_check                    = true
  #  subnet_id                            = "subnet-09cd9f9afcd03dc1b"
  #  tags = {
  #    Name    = "lab_instancia02"
  #    project = "lab01"
  #  }
  #  tags_all = {
  #    Name    = "lab_instancia02"
  #    project = "lab01"
  #  }
  #  tenancy                     = "default"
  #  user_data                   = "e912ba314ded5a44cbae03933f92df6fbe456aaa"
  #  user_data_base64            = null
  #  user_data_replace_on_change = null
  #  volume_tags                 = null
  #  vpc_security_group_ids      = ["sg-0c61d956de1cf3c7a"]
  #  capacity_reservation_specification {
  #    capacity_reservation_preference = "open"
  #  }
  #  cpu_options {
  #    amd_sev_snp      = null
  #    core_count       = 1
  #    threads_per_core = 2
  #  }
  #  credit_specification {
  #    cpu_credits = "unlimited"
  #  }
  #  enclave_options {
  #    enabled = false
  #  }
  #  maintenance_options {
  #    auto_recovery = "default"
  #  }
  #  metadata_options {
  #    http_endpoint               = "enabled"
  #    http_protocol_ipv6          = "disabled"
  #    http_put_response_hop_limit = 2
  #    http_tokens                 = "required"
  #    instance_metadata_tags      = "disabled"
  #  }
  #  private_dns_name_options {
  #    enable_resource_name_dns_a_record    = false
  #    enable_resource_name_dns_aaaa_record = false
  #    hostname_type                        = "ip-name"
  #  }
  #  root_block_device {
  #    delete_on_termination = true
  #    encrypted             = false
  #    iops                  = 3000
  #    kms_key_id            = null
  #    tags                  = {}
  #    tags_all              = {}
  #    throughput            = 125
  #    volume_size           = 8
  #    volume_type           = "gp3"
  #  }
  ##}
  ##
  ### __generated__ by Terraform
  #resource "aws_instance" "lab_instancia01" {
  #  ami                                  = "ami-052064a798f08f0d3"
  #  associate_public_ip_address          = false
  #  availability_zone                    = "us-east-1a"
  #  disable_api_stop                     = false
  #  disable_api_termination              = false
  #  ebs_optimized                        = true
  #  enable_primary_ipv6                  = null
  #  get_password_data                    = false
  #  hibernation                          = false
  #  host_id                              = null
  #  host_resource_group_arn              = null
  #  iam_instance_profile                 = null
  #  instance_initiated_shutdown_behavior = "stop"
  #  instance_type                        = "t3.micro"
  #  ipv6_addresses                       = []
  #  key_name                             = null
  #  monitoring                           = false
  #  placement_group                      = null
  #  placement_partition_number           = 0
  #  private_ip                           = "10.0.2.60"
  #  secondary_private_ips                = []
  #  security_groups                      = []
  #  source_dest_check                    = true
  #  subnet_id                            = "subnet-0ec717e10bb806d30"
  #  tags = {
  #    Name    = "lab_instancia01"
  #    project = "lab01"
  #  }
  #  tags_all = {
  #    Name    = "lab_instancia01"
  #    project = "lab01"
  #  }
  #  tenancy                     = "default"
  #  user_data                   = "ad057c6b3cc22099dea866e14b0d3e6a5b8927ba"
  #  user_data_base64            = null
  #  user_data_replace_on_change = null
  #  volume_tags                 = null
  #  vpc_security_group_ids      = ["sg-0c61d956de1cf3c7a"]
  #  capacity_reservation_specification {
  #    capacity_reservation_preference = "open"
  #  }
  #  cpu_options {
  #    amd_sev_snp      = null
  #    core_count       = 1
  #    threads_per_core = 2
  #  }
  #  credit_specification {
  #    cpu_credits = "unlimited"
  #  }
  #  enclave_options {
  #    enabled = false
  #  }
  #  maintenance_options {
  #    auto_recovery = "default"
  #  }
  #  metadata_options {
  #    http_endpoint               = "enabled"
  #    http_protocol_ipv6          = "disabled"
  #    http_put_response_hop_limit = 2
  #    http_tokens                 = "required"
  #    instance_metadata_tags      = "disabled"
  #  }
  #  private_dns_name_options {
  #    enable_resource_name_dns_a_record    = false
  #    enable_resource_name_dns_aaaa_record = false
  #    hostname_type                        = "ip-name"
  #  }
  #  root_block_device {
  #    delete_on_termination = true
  #    encrypted             = false
  #    iops                  = 3000
  #    kms_key_id            = null
  #    tags                  = {}
  #    tags_all              = {}
  #    throughput            = 125
  #    volume_size           = 8
  #    volume_type           = "gp3"
  #  }
  #}
