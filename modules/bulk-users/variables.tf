variable "pingone_environment_id" {
  type = string
}
variable "bulk_users" {
  type        = map(any)
  description = "Map of users to import.  Must follow schema in the examples"
}
