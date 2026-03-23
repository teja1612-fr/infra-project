packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = ">= 1.0.0"
    }
  }
}

source "amazon-ebs" "example" {
  region        = "ap-south-1"
  instance_type = "t2.micro"

  source_ami_filter {
    filters = {
      name = "amzn2-ami-hvm-*"
    }
    most_recent = true
    owners      = ["amazon"]
  }

  ssh_username = "ec2-user"
  ami_name     = "teja-ami-{{timestamp}}"
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "shell" {
    inline = [
  "sudo yum update -y",
  "sudo amazon-linux-extras install nginx1 -y",
  "sudo systemctl start nginx"
]
  }
}
