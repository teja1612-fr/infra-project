packer {
  required_plugins {
    amazon = {
      source = "github.com/hashicorp/amazon"
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
      "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}
