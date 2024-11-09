resource "aws_security_group" "postgres_sg" {
  name        = "postgres-security-group"
  description = "Allow SSH and PostgreSQL access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "main_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.postgres_sg.name]
  user_data       = file("userdata.sh")

  tags = {
    Name = "pb_partners"
  }
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}
