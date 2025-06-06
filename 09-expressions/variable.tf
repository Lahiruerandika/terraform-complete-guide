variable "number_list" {
  type = list(number)

}

variable "numbers_map" {
  type = map(number)
}

variable "object_list" {
  type = list(object({
    first_name = string
    last_name  = string
  }))
}

variable "users" {
  type = list(object({
    username = string
    role     = string
    })
  )
}