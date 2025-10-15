provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.ssh_key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "sg" {
  name = "todo-sg"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = { Name = "todo-api-server" }
}

output "public_ip" {
  value = aws_instance.app.public_ip
}