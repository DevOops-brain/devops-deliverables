module "demo" {
  source = "../../task3/module"
  
  name = "web-server"
  ami = "ami-04a81a99f5ec58529" # change accourdingly
  instance_type = "t3.micro"
  key_name = "example-key" # Replace with your key pair name

## SG config  
  cidr_ipv4   = "183.83.146.120/32" # change to your ip
  port   = 22
  ip_protocol = "TCP"

## VPC configs
  vpc_cidr = "10.0.0.0/20"
  vpc_name = "demo-vpc"
}