locals {
    common_tags = {
        project = var.project
        environment = var.environment
        Terraform = "true"
    }
    private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
    sg_id = data.aws_ssm_parameter.sg_id.value
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
    frontend_alb_listener_arn = data.aws_ssm_parameter.frontend_alb_listener_arn.value
    alb_listener_arn = var.component == "frontend" ? local.frontend_alb_listener_arn : local.backend_alb_listener_arn
    health_check_path = var.component == "frontend" ? "/" : "/health"
    port_number = var.component == "frontend" ? 80 : 8080  
    host_header = var.component == "frontend" ? "${var.component}-${var.environment}.${var.domain_name}" : "${var.component}.backend-alb-${var.environment}.${var.domain_name}"
}