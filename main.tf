data "aws_ami" "myami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.myami.id
  key_name               = "tf-pair"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  tags = {
    "Name" = "Jenkins"
  }
}