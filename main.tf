module "vpc_module" {
    source = "./modules/aws_vpc"
    vpc_cidr = var.vpc_cidr
    vpc_tags = var.vpc_tags
}
module "aws_subnet" {
    source = "./modules/aws_subnet"

    vpc_id = module.vpc_module.vpc_id1
    subnet_cidr = var.subnet_cidr
    subnet_tags = var.subnet_tags
  
}

module "sg" {
    source = "./modules/aws_sg "
    sg = var.sg
    vpc_id = module.vpc_module.vpc_id1
    
}
module "nic" {
    source = "./modules/aws_nic"
    for_each = var.instance_config
  subnet_id = module.aws_subnet.subnet_id1
  private_ip = each.value.private_ip
  nic_name = each.value.nic_name
}

module "instance" {
 source = "./modules/aws_instance"
        depends_on = [module.nic]

 for_each = var.instance_config
 instance_ami = each.value.instance_ami
 instance_type = each.value.instance_type
 nic_id = module.nic[each.key].nic_id1
 instance_name = each.value.instance_name

}


/* this code used for create extra instance in another region
module "instance_easrt" {
 source = "./modules/aws_instance"
 providers = {
   aws = aws.east_1
  }
 instance_ami = var.instance_ami
 instance_type = var.instance_type
 nic_id = module.nic.nic_id1
 instance_name = var.instance_name

} */