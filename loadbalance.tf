# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.


#resource "aws_lb_listener" "public-listener-http" {
#  load_balancer_arn = aws_lb.test.arn
#  port              = "80"
#  protocol          = "HTTP"
#  #ssl_policy        = "ELBSecurityPolicy-2016-08"
#  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
#
#  default_action {
#    type             = "forward"
#    target_group_arn = aws_lb_target_group.targetgroup01.arn
#  }
#  tags = {
#    project = "lab01"
#  }
#}
#resource "aws_lb" "test" {
#  name               = "labpessoal01-alb"
#  internal           = false
#  load_balancer_type = "application"
#  security_groups    = [aws_security_group.PublicALB.id]
#  subnets            = [aws_subnet.labpessoal01-subnet-public1-us-east-1a.id, aws_subnet.labpessoal01-subnet-public2-us-east-1b.id]
#  #target_group_arns  = [aws_lb_target_group.targetgroup01.arn]
#
#  enable_deletion_protection = false
#
#  tags = {
#    project = "lab01"
#  }
#}

# __generated__ by Terraform
resource "aws_lb_target_group" "targetgroup01" {
  connection_termination             = null
  deregistration_delay               = "300"
  ip_address_type                    = "ipv4"
  lambda_multi_value_headers_enabled = null
  load_balancing_algorithm_type      = "round_robin"
  load_balancing_anomaly_mitigation  = "off"
  load_balancing_cross_zone_enabled  = "use_load_balancer_configuration"
  name                               = "targetgroup01"
  name_prefix                        = null
  port                               = 80
  preserve_client_ip                 = null
  protocol                           = "HTTP"
  protocol_version                   = "HTTP1"
  proxy_protocol_v2                  = null
  slow_start                         = 0
  tags = {
    project = "lab01"
  }
  tags_all = {
    project = "lab01"
  }
  target_type = "instance"
  vpc_id      = "vpc-0bf4705c4dd014638"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
  stickiness {
    cookie_duration = 86400
    cookie_name     = null
    enabled         = false
    type            = "lb_cookie"
  }
  target_failover {
    on_deregistration = "no_rebalance"
    on_unhealthy      = "no_rebalance"
  }
  target_group_health {
    dns_failover {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
    unhealthy_state_routing {
      minimum_healthy_targets_count      = 1
      minimum_healthy_targets_percentage = "off"
    }
  }
  target_health_state {
    enable_unhealthy_connection_termination = false
    unhealthy_draining_interval             = null
  }
}
