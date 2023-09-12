variable "pingone_environment_id" {
  type        = string
  description = "PingOne Environment to affect user"
}
variable "scoped_environment_id" {
  type        = string
  description = "PingOne Environment to assign roles to"
}
variable "username" {
  type        = string
  description = "Username of admin user in PingOne Environment"
}
variable "roles" {
  type        = set(string)
  description = "Set of role names"
}
