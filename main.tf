resource "oci_objectstorage_private_endpoint" "this" {
  compartment_id      = var.compartment_id
  name                = var.private_endpoint_name
  subnet_id           = var.subnet_id
  prefix              = var.private_endpoint_prefix
  namespace           = data.oci_objectstorage_namespace.this.namespace
  nsg_ids             = var.nsg_ids
  private_endpoint_ip = var.private_ip
  additional_prefixes = var.additional_prefixes
  state               = var.state
  fqdns               = var.fqdns
  defined_tags        = var.defined_tags
  freeform_tags       = var.freeform_tags

  dynamic "access_targets" {
    for_each = var.access_targets
    content {
      bucket         = access_targets.value.bucket_name
      compartment_id = access_targets.value.compartment_id
      namespace      = data.oci_objectstorage_namespace.this.namespace
    }
  }
}

data "oci_objectstorage_namespace" "this" {}
