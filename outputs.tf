output "vpc-id" {
  value = module.instance-nginx.VpcId
}

output "instance-ip" {
  value = module.instance-nginx.instance_public_ip
}