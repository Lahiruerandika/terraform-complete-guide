output "module_vpc_id" {
  value = module.vpc.vpc_id
}



output "module_private_subnets" {
  value = module.vpc.private_subnets
}