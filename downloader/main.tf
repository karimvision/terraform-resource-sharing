// step 1: create ec2 instance
resource "aws_instance" "terraform_test_ec2" {
  ami                         = "ami-0574da719dca65348" // ubuntu 22
  instance_type               = "t2.medium"
  key_name                    = var.aws_keypair_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = true
  monitoring                  = false
  availability_zone           = "us-east-1a"
  tags = {
    Name = "terraform-test-ec2"
    User = "Karim"
  }
}

// step 2: create ec2 volume
resource "aws_ebs_volume" "terraform_test_ebs" {
  availability_zone = "us-east-1a"
  size              = 1
  tags = {
    Name = "terraform-test-ebs"
    User = "Karim"
  }
}

// step 3: attach ec2 instance to ec2 volume
resource "aws_volume_attachment" "ebs_att" {
  device_name  = "/dev/sdh"
  volume_id    = aws_ebs_volume.terraform_test_ebs.id
  instance_id  = aws_instance.terraform_test_ec2.id
  skip_destroy = false
}
