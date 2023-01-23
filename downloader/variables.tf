output "created_ebs_volume" { value = aws_ebs_volume.terraform_test_ebs.id }
variable "aws_keypair_name" {}
variable "vpc_security_group_ids" { default = ["sg-06382a3a8128fb764"] }
variable "subnet_id" { default = "subnet-093fd48c37577e4dd" }
