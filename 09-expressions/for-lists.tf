locals {
  double_numbers = [for number in var.number_list : number * 2]
  even_number    = [for number in var.number_list : number if number % 2 == 0]
  first_names    = [for persons in var.object_list : persons.first_name]
  full_names     = [for persons in var.object_list : "${persons.first_name} ${persons.last_name}"]
}

output "doubles" {
  value = local.double_numbers
}

output "even_nubmer" {
  value = local.even_number
}

output "first_names" {
  value = local.first_names
}

