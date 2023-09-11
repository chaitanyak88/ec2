module "Tf_vpc" {
  source = "./modules/networking"
  vpc_tags = {
   Name = "Tag Test"
   Location = "HYD"  
             }
} 


module "ec2_instance" {
  # Name = "EC2-$[count.index + 1]"
  source = "./modules/ec2"
  vpc_id = module.Tf_vpc.vpc_id
  ami = "ami-0c147c2e2b026f094"
  key_name = "sharath"
  subnet_ids = module.Tf_vpc.pub_sub_ids
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
