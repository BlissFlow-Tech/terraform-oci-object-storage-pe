# terraform-oci-object-storage-pe

Terraform module that creates an OCI Object Storage private endpoint, so buckets are reached from a VCN subnet without public internet access.

## Usage

```hcl
module "object_storage_pe" {
  source  = "blissflow-tech/object-storage-pe/oci"
  version = "~> 1.1"

  compartment_id          = "ocid1.compartment.oc1..example"
  subnet_id               = "ocid1.subnet.oc1..example"
  private_endpoint_name   = "objectstorage-pe"
  private_endpoint_prefix = "storage"
  nsg_ids                 = ["ocid1.networksecuritygroup.oc1..example"]

  access_targets = [
    {
      bucket_name    = "backups"
      compartment_id = "ocid1.compartment.oc1..example"
    },
  ]
}
```

## Notes

* The Object Storage namespace comes from the provider's tenancy and applies to every access target.
* `access_targets` accepts `"*"` for `bucket_name` and `compartment_id` to open every bucket in the namespace.
* `private_endpoint_prefix` and `additional_prefixes` become the leading label of the endpoint FQDNs.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.3 |
| oci | >= 8.0, < 10.0 |

## Providers

| Name | Version |
| ---- | ------- |
| oci | >= 8.0, < 10.0 |

## Resources

| Name | Type |
| ---- | ---- |
| [oci_objectstorage_private_endpoint.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_private_endpoint) | resource |
| [oci_objectstorage_namespace.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/objectstorage_namespace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| access\_targets | Buckets reachable through the private endpoint; the namespace is the tenancy namespace | <pre>list(object({<br/>    bucket_name    = string<br/>    compartment_id = string<br/>  }))</pre> | n/a | yes |
| compartment\_id | The OCID of the compartment where the Private Endpoint will be created (Infrastructure). | `string` | n/a | yes |
| private\_endpoint\_name | The user-friendly name for the Private Endpoint. | `string` | n/a | yes |
| private\_endpoint\_prefix | The prefix used to create the FQDN for the Private Endpoint. | `string` | n/a | yes |
| subnet\_id | The OCID of the subnet the Private Endpoint will reside in. | `string` | n/a | yes |
| additional\_prefixes | List of additional prefixes to create more FQDNs for the PE. | `list(string)` | `[]` | no |
| defined\_tags | Defined tags for the private endpoint | `map(string)` | `{}` | no |
| fqdns | FQDN settings passed through to the private endpoint fqdns argument | `any` | `{}` | no |
| freeform\_tags | Freeform tags for the private endpoint | `map(string)` | `{}` | no |
| nsg\_ids | Optional list of Network Security Groups to apply to the PE. | `list(string)` | `[]` | no |
| private\_ip | Optional: Specify a fixed private IP from the subnet. If null, OCI assigns one. | `string` | `null` | no |
| state | Lifecycle state to request for the private endpoint; null leaves it to OCI | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| access\_targets | A list of access target |
| additional\_prefixes | Additional prefixes of the private endpoint |
| compartment\_id | The compartment ID of this resource |
| created\_by | information about the user who created this resource |
| defined\_tags | Defined tags |
| fqdns | The FQDN's for the Object Storage API. |
| freeform\_tags | Freeform tags |
| id | The OCID of the Private Endpoint. |
| namespace | The Object Storage namespace. |
| nsg\_ids | A list of network security group id's |
| prefix | The private endpoint prefix |
| private\_endpoint\_ip | The internal IP address assigned to the Private Endpoint. |
| state | Resource state |
| subnet\_id | The subnet ID of the private endpoint |
| time\_created | Creation time of this resource |
| time\_modified | The last time this resource modified |
<!-- END_TF_DOCS -->

## License

Apache 2.0. See [LICENSE](LICENSE).
