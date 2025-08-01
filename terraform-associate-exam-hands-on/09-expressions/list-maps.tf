locals {
  user_map = { for user_info in var.users : user_info.username => user_info.role...}

  user_map2 = { for username, role in local.user_map : username => {roles = role}}

  usernames_from_map = [ for username, role in local.user_map : username]
}

output "users_map" {
    value = local.user_map
}

output "users_map2" {
    value = local.user_map2
}

output "usernames_from_map" {
    value = local.usernames_from_map
}

