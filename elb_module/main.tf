resource "aws_lb_listener" "public_listener_https" {
  load_balancer_arn = aws_lb.app_loadbalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  
  certificate_arn   = var.https-cert

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.intance_targetgroup.arn
  }
  tags = {
    project = "${var.project_name}"
  }
}

resource "aws_lb_listener" "public-listener-http" {
  
  load_balancer_arn = aws_lb.app_loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      protocol = "HTTPS"  
      port     = "443"
      status_code = "HTTP_301"
    }
  }

  tags = {
    project = "${var.project_name}"
  }
}

/* resource "aws_lb_listener_rule" "redirect_http_to_https" {
  
  listener_arn = aws_lb_listener.public-listener-http.arn
  priority     = 100

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    
  }

} */


resource "aws_lb" "app_loadbalancer" {

  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = "application"
  
  security_groups    = [var.alb_security_group_ids]
  
  subnets             = var.subnet_id

  enable_deletion_protection = false

  tags = {
    project = "${var.project_name}"
  }
}

resource "aws_lb_target_group" "intance_targetgroup" {
  
  connection_termination             = null
  deregistration_delay               = "300"
  ip_address_type                    = "ipv4"
  lambda_multi_value_headers_enabled = null
  load_balancing_algorithm_type      = "round_robin"
  load_balancing_anomaly_mitigation  = "off"
  load_balancing_cross_zone_enabled  = "use_load_balancer_configuration"
  
  name = "${var.project_name}-intance-tg"
  
  name_prefix                        = null
  port                               = 80
  preserve_client_ip                 = null
  protocol                           = "HTTP"
  protocol_version                   = "HTTP1"
  proxy_protocol_v2                  = null
  slow_start                         = 0
  tags = {
    project = "${var.project_name}"
  }
  target_type = "instance"
  
  vpc_id = var.vpc_id
  
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 10
    unhealthy_threshold = 5
  }
  stickiness {
    cookie_duration = 86400
    cookie_name     = null
    enabled         = false
    type            = "lb_cookie"
  }
  target_group_health {
    dns_failover {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
    unhealthy_state_routing {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
  }
}

resource "aws_lb_target_group_attachment" "intance_targetgroup_attachment" {
  # covert a list of instance objects to a map with instance ID as the key, and an instance
  # object as the value.
  for_each = {
    for k, v in var.target_instances:
    k => v
  }

  target_group_arn = aws_lb_target_group.intance_targetgroup.arn
  target_id        = each.value.id
  port             = 80
}
