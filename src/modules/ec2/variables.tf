variable "region" {
  type = string
}

variable "ami" {
  type = map(string)
}

variable "subnet_public_id" {
  type = any
}

variable "sg_public_id" {
  type = any
}

variable "instance_type" {
 type = string
 default = "t1.micro"
 description = "EC2 instance type"
}

variable "instance_count" {
  default = "4"
}
