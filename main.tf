

module "downloader" {
  source           = "./downloader"
  aws_keypair_name = var.aws_keypair_name
}

module "ingestion_part1" {
  source     = "./ingestion_part1"
  ebs_volume = module.downloader

}

module "ingestion_part2" {
  source     = "./ingestion_part2"
  ebs_volume = module.downloader
}

module "ingestion_part3" {
  source     = "./ingestion_part3"
  ebs_volume = module.downloader.created_ebs_volume
}

output "part1_ebs_shared_value" { value = module.ingestion_part1.part1_input_ebs_volume }
output "part2_ebs_shared_value" { value = module.ingestion_part2.part2_input_ebs_volume }
output "part3_ebs_shared_value" { value = module.ingestion_part3.part3_input_ebs_volume }
