variable "rg_name" {
    type = string
    description = "Azure resource group name"
}

variable "rg_location" {
    type = string
    description = "Azure resource group location"
}

variable "project_name" {
  type = string
  description = "Name of project"
}

variable "nsg_security_rules" {
  type = map(map(string))
  description = "Describes the security group rules for the NSG"
}