provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "latest" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["teja-ami-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.latest.id
  instance_type = "t2.micro"

  key_name = "teja-key"   

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Teja-Server"
  }
}
