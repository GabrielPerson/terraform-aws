output "alb_arn" {
    description = "ARN of the Application Load Balancer"
    value       = aws_lb.app_loadbalancer.arn
}

output "alb_dns_name" {
    description = "DNS name of the Application Load Balancer"
    value       = aws_lb.app_loadbalancer.dns_name
}

output "alb_security_group_ids" {
    description = "Security group IDs attached to the ALB"
    value       = aws_lb.app_loadbalancer.security_groups
}

output "alb_listener_https_arn" {
    description = "ARN of the HTTPS listener"
    value       = aws_lb_listener.public_listener_https.arn
}

output "alb_listener_http_arn" {
    description = "ARN of the HTTP listener"
    value       = aws_lb_listener.public-listener-http.arn
}

output "target_group_arn" {
    description = "ARN of the target group"
    value       = aws_lb_target_group.intance_targetgroup.arn
}