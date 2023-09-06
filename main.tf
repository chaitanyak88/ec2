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
}
