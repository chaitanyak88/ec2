module "Tf_vpc" {
  source = "./modules/networking"
  vpc_tags = {
   Name = "Tag Test"
   Location = "HYD"  
             }
} 
