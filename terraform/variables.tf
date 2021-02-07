variable "rg_location" {
  type = string
  default = "North Europe"
  description = "(optional) AZ rgs are available everywhere"
}

variable "project_name" {
  type = string
  description = "Name of project"
}

variable "nsg_security_rules" {
  type = map(map(string))
  description = "Describes the security group rules for the NSG"
}

variable "subscription_id" {
  type = string
  description = "Identifier of the subscription to deploy in"
}