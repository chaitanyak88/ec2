resource "aws_vpc" "vpc1"{
	cidr_block = var.vpc_cidr
	instance_tenancy = "default"
	tag = var.vpc_tags
	
}
