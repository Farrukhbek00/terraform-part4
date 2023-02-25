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
