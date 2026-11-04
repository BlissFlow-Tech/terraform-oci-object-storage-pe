# Basic example

Creates an Object Storage private endpoint in an existing subnet that reaches every bucket in the tenancy namespace.

```sh
terraform init
terraform apply -var compartment_id=<compartment-ocid> -var subnet_id=<subnet-ocid>
```
