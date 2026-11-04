output "id" {
  description = "The OCID of the Private Endpoint."
  value       = oci_objectstorage_private_endpoint.this.id
}

output "private_endpoint_ip" {
  description = "The internal IP address assigned to the Private Endpoint."
  value       = oci_objectstorage_private_endpoint.this.private_endpoint_ip
}

output "namespace" {
  description = "The Object Storage namespace."
  value       = data.oci_objectstorage_namespace.this.namespace
}

output "fqdns" {
  description = "The FQDN's for the Object Storage API."
  value       = oci_objectstorage_private_endpoint.this.fqdns
}

output "time_modified" {
  description = "The last time this resource modified"
  value       = oci_objectstorage_private_endpoint.this.time_modified
}

output "defined_tags" {
  description = "Defined tags"
  value       = oci_objectstorage_private_endpoint.this.defined_tags
}

output "freeform_tags" {
  description = "Freeform tags"
  value       = oci_objectstorage_private_endpoint.this.freeform_tags
}

output "created_by" {
  description = "information about the user who created this resource"
  value       = oci_objectstorage_private_endpoint.this.created_by
}

output "nsg_ids" {
  description = "A list of network security group id's"
  value       = oci_objectstorage_private_endpoint.this.nsg_ids
}

output "access_targets" {
  description = "A list of access target"
  value       = oci_objectstorage_private_endpoint.this.access_targets
}

output "prefix" {
  description = "The private endpoint prefix"
  value       = oci_objectstorage_private_endpoint.this.prefix
}

output "state" {
  description = "Resource state"
  value       = oci_objectstorage_private_endpoint.this.state
}

output "time_created" {
  description = "Creation time of this resource"
  value       = oci_objectstorage_private_endpoint.this.time_created
}

output "compartment_id" {
  description = "The compartment ID of this resource"
  value       = oci_objectstorage_private_endpoint.this.compartment_id
}

output "subnet_id" {
  description = "The subnet ID of the private endpoint"
  value       = oci_objectstorage_private_endpoint.this.subnet_id
}

output "additional_prefixes" {
  description = "Additional prefixes of the private endpoint"
  value       = oci_objectstorage_private_endpoint.this.additional_prefixes
}
