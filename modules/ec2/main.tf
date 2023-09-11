resource "aws_instance" "instance" {
    count = var.count1
    ami = var.ami
    instance_type = var.ins_type
    associate_public_ip_address = var.public_id
    subnet_id = var.subnet_ids[count.index]
    vpc_security_group_ids = [aws_security_group.web.id]
    key_name = var.key_name
    user_data = file("./scripts/httpd.sh")
    user_data_replace_on_change = true 
    tags = {
     Name = "EC2-${count.index + 1}"

     }
 
}

# Create SG for EC2

resource "aws_security_group" "web" {
    name = "Allow Traffic for Web"
    description = "Allow Inbond Traffic"
    vpc_id = var.vpc_id
    dynamic "ingress" {
        for_each=var.web_ingress_rules
        content{
            description = "Some Decription"
            from_port=ingress.value.port
            to_port=ingress.value.port
            protocol=ingress.value.protocol
            cidr_blocks=ingress.value.cidr_blocks
        }   
    }
        egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
        ipv6_cidr_blocks=["::/0"]
    }
    tags={
        Name="ec2_security_rules"
    }
}