variable "compartment_id" {
  type        = string
  description = "The OCID of the compartment where the Private Endpoint will be created (Infrastructure)."
}

variable "private_endpoint_name" {
  type        = string
  description = "The user-friendly name for the Private Endpoint."
}

variable "subnet_id" {
  type        = string
  description = "The OCID of the subnet the Private Endpoint will reside in."
}

variable "private_endpoint_prefix" {
  type        = string
  description = "The prefix used to create the FQDN for the Private Endpoint."
}

variable "nsg_ids" {
  type        = list(string)
  description = "Optional list of Network Security Groups to apply to the PE."
  default     = []
}

variable "private_ip" {
  type        = string
  description = "Optional: Specify a fixed private IP from the subnet. If null, OCI assigns one."
  default     = null
}

variable "additional_prefixes" {
  type        = list(string)
  description = "List of additional prefixes to create more FQDNs for the PE."
  default     = []
}

variable "access_targets" {
  description = "Buckets reachable through the private endpoint; the namespace is the tenancy namespace"
  type = list(object({
    bucket_name    = string
    compartment_id = string
  }))
}

variable "defined_tags" {
  description = "Defined tags for the private endpoint"
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags for the private endpoint"
  type        = map(string)
  default     = {}
}

variable "state" {
  description = "Lifecycle state to request for the private endpoint; null leaves it to OCI"
  type        = string
  default     = null
}

variable "fqdns" {
  description = "FQDN settings passed through to the private endpoint fqdns argument"
  type        = any
  default     = {}
}
