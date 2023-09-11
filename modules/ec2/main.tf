resource "aws_instance" "instance" {
    count = var.count1
    # Name = "EC2-${count.index + 1}"
    ami = var.ami
    instance_type = var.ins_type
    associate_public_ip_address = var.public_id
    subnet_id = var.subnet_ids[count.index]
    # vpc_security_group_ids = []
    key_name = var.key_name
    tags = {
     Name = "EC2-${count.index + 1}"
     }
 


}