resource "aws_instance" "bastion_host" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnets[0].id
  security_groups = [aws_security_group.bastion_sg.id]
}