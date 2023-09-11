module "Tf_vpc" {
  source = "./modules/networking"
  vpc_tags = {
   Name = "Tag Test"
   Location = "HYD"  
             }
} 


module "alb" {
  source = "./modules/alb"
  vpc_id = module.Tf_vpc.vpc_id
  subnet_ids = module.Tf_vpc.pub_sub_ids
  alb_ingress_rules = {
    "80" = {
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "allow 80 everywhere"
    }
  }
}
