variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMI" {
  type = map(any)
  default = {
    us-east-1 = "ami-0e86e20dae9224db8"
    us-east-2 = "ami-085f9c64a9b75eed5"
  }
}

variable "USER" {
  default = "ubuntu"
}
