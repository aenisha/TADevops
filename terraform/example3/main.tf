provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_instance_1" {
  ami               = "ami-0e86e20dae9224db8"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "devops-anisha"

  vpc_security_group_ids = ["sg-0d967cfbe1ebefbee"]

  tags = {
    Name      = "AnishaMaharjan"
    CreatedBy = "Terraform"
  }

  # File provisioner to copy a script to the instance
  provisioner "file" {
    source = "deploy"
    destination = "/tmp/deploy"

    connection {
      type        = "ssh"
      user        = var.USER
      private_key = file("devops-anisha.pem")
      host        = self.public_ip
    }
  }

  # Remote exec provisioner to run commands on the instance
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/deploy",
      "sudo /tmp/deploy"
    ]

    connection {
      type        = "ssh"
      user        = var.USER
      private_key = file("devops-anisha.pem")
      host        = self.public_ip
    }
  }
}

output "Public_IP" {
  value = aws_instance.ec2_instance_1.public_ip
}

output "Private_IP" {
  value = aws_instance.ec2_instance_1.private_ip
}
