variable "compartment_id" {
  description = "OCID of the compartment that holds the private endpoint"
  type        = string
}

variable "subnet_id" {
  description = "OCID of the subnet the private endpoint is placed in"
  type        = string
}
