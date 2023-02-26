locals {
    instances = {
        instance_type = var.instance_type
    }
}

resource "aws_instance" "Public-ec2" {
    count         = var.instance_count
    ami           = "${lookup(var.ami, var.region)}"
    instance_type = local.instances.instance_type

    subnet_id              = "${var.subnet_public_id}"
    vpc_security_group_ids = ["${var.sg_public_id}"]
    key_name               = "${aws_key_pair.key_pair.id}"

    tags = {
        Name: "Public-ec2-${count.index + 1}"
    }
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "local_file" "private_key" {
  filename          = "key.pem"
  sensitive_content = tls_private_key.key.private_key_pem
  file_permission   = "0400"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "key"
  public_key = tls_private_key.key.public_key_openssh
}