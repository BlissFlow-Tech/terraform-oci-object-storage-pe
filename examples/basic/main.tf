module "object_storage_pe" {
  source = "../.."

  compartment_id          = var.compartment_id
  subnet_id               = var.subnet_id
  private_endpoint_name   = "objectstorage-pe"
  private_endpoint_prefix = "storage"

  access_targets = [
    {
      bucket_name    = "*"
      compartment_id = "*"
    },
  ]
}

output "fqdns" {
  value = module.object_storage_pe.fqdns
}
