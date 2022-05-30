#Directory = /home/cmpdev/anoop/aws/tfvar-complex-type-test-3
#File1 = main.tf
#File2 = variables.tf

#File =main.tf
variable "access_key" {}
variable "secret_key" {}
variable "region" {
 default = "us-east-1"
}


provider "aws" {
 access_key = "${   var.access_key }"
 secret_key = var.secret_key
 region     = "${  var.region}"
 version    = ">= 3.0"
}

resource "aws_instance" "example" {
 ami           = "${var.ami}"
 instance_type = var.type[1]
 tags = var.tags
 network_interface {
  network_interface_id = aws_network_interface.my_nic.id
  device_index         = 0
 }
}

resource "aws_network_interface" "my_nic" {
 description = "My NIC"
 subnet_id   = var.subnet[0]["name"]
 
 tags = {
   Name = var.mapvar["name"]
 }
}
