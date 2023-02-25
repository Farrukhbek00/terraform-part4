module "networking" {
  source = "./modules/networking"
}

module "sg" {
  source         = "./modules/sg"
  vpc_id         = module.networking.vpc_id
}

module "ec2" {
  source             = "./modules/ec2"
  region             = var.region
  ami                = var.ami
  subnet_public_id   = module.networking.subnet_public_id
  sg_public_id       = module.sg.sg_public_id
}

