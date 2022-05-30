#File =variables.tf
variable "imageset" {
	type = set(string)
	default = [
	"a",
	"b", "a"]
}

variable "mapvar" {
  default = {
	  "name" = "first tag"
	  number = 958,
	  age = 45
  }
  type = map
}

variable "ami" {
    type        = string
    default          =  "ami-0022f774911c1d690"

    description = "AMI ID for the EC2 instance"
}
 
variable "type" {
 type        = list
 description = "Instance types for the EC2 instance"
 default     = ["t2.micro",
 					"m1.small"
				]
}
 
variable    "tags"   {
 description = "Tags for the EC2 instance"

 default    =  {
   name = "My Virtual Machine"
   env  = "Dev",
   isAvailable = true
 }

type     = object({
   name = string
   env  = string,
   isAvailable = bool
 })
}

variable      "subnet" {
 type = tuple([ object({
   name = string
   env  = string,
   isAvailable = bool
 }), bool
 ])
 description = "Subnet ID for network interface"
 
 default = [{
   name = "subnet-282a4575"
   env  = "Dev",
   isAvailable = true
 }, false]


}
