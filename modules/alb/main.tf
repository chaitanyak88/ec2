##################################################### TARGET GroUP ##########################
resource "aws_lb_target_group" "myalb" {
  name     = var.tg_name 
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
}

######################################  ALB ############################

resource "aws_lb" "Applb" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]
