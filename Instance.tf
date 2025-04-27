resource "aws_instance" "web" {
  ami           = "ami-0069aa073aac75299"
  instance_type = "t3.micro"
  key_name = "ananta"
  vpc_security_group_ids = [aws_security_group.ananta-sg.id]
  availability_zone = "us-east-1a"
  tags = {
    Name = "HelloWorld"
  }
}