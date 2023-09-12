variable "pingone_application" {
  type        = any
  description = "PingOne application to assign roles to"
}
variable "roles" {
  type        = set(string)
  description = "Set of role names"
}
