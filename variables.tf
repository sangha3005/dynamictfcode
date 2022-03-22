
variable "subnet_cidr"{
  type = string
  default = "10.0.1.0/24"

}

variable "subnet_tags" {
  type = map(any)
  default = {
    "Name" = "my-subnet"
  }

}




variable "vpc_cidr"{
type = string
default = "10.0.0.0/16"
}

variable "vpc_tags"{
type = map(any)
default = {
  "Name" = "tf-example"
}

}

variable "sg"{
  type = map(any)
  default = {
  "Name" = "allow_tls"

  }
}



variable "nic_name" {
  type = map(any)
  default = {
      "Name" = "primary_network_interface"
  }
  
  }
  
variable "private_ip" {
  type = list(string)
  default = [ "10.0.1.10"]
  
}
variable "instance_ami" {
  type = string
  default = "ami-079e7a3f57cc8e0d0"
  
}

variable "instance_name" {
  type = map(any)
  default = {
    "Name" = "prod_server"  
  }
  }

  variable "instance_type" {
    type = string
    default = "t2.micro"
    
  }

variable "instance_config" {
  type = map(any)
  

  }  



 