variable "region" { default = "us-east-1" }
variable "ami" { default = "ami-0c02fb55956c7d316" } # Ubuntu 22.04 LTS (change per region)
variable "instance_type" { default = "t2.micro" }
variable "ssh_key_name" { type = string }
variable "public_key_path" { type = string }