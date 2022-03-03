# Create a new load balancer
resource "aws_elb" "default" {
  name = var.name
  subnets = var.subnets
  security_groups = var.security_groups

  listener {
    instance_port     = var.instance_port
    instance_protocol = "http"
    lb_port           = var.lb_port
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout
  description                 = var.description

  tags {
    Name    = "${var.name}-elb"
  }
}
