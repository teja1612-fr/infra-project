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

  tags = {
    Name = "Teja-Server"
  }
}
