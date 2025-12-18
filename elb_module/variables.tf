variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "https-cert" {
  type = string
}

variable "subnet_id" {
  type = list(string)
}

variable "alb_security_group_ids" {
  type = string
}

variable "target_instances" {
}