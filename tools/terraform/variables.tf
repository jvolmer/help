variable "location" {} # type will be determined by input value

variable "admin_username" {
    type = string
    description = "Administrator user name for virtual machine"
}

variable "admin_password" {
    type = string
    description = "Password must meet Azure complexity requirements"
}

variable "prefix" {
  type    = string
  default = "my"
}

variable "tags" {
  type = map           # explicit type

  default = {
    Environment = "Terraform GS"
    Dept        = "Engineering"
  }
}

variable "sku" {
  default = {          # implicit map type via default value
    westus2 = "16.04-LTS"
    westeurope  = "18.04-LTS"
  }
}

# populate variables with values in terraform.tfvars or *.auto.tfvars in same directory

# map: collection of string values
# object: group different kinds of vlues a strings, bools and/or numbers

# assign sensitive variables without beeing prompted every time when running apply:
# > terraform apply -var 'admin_username=plankton' -var 'admin_password=Password1234!'
