
# terraform-google-kubernetes-serviceaccount
Terraform module to create a service account on google cloud, a json key and push it as a secret into kubernetes cluster.


## 1. Configuration:

You need to have your kubernetes cluster installed and your terraform ([kubernetes provider](https://www.terraform.io/docs/providers/kubernetes/index.html)) needs to be configured to point to your cluster. 

## 2. Usage

e.g.: **serviceaccounts.tf**
```hcl
module "cloudsql-proxy" {
  name        = "cloudsql-proxy"
  source      = "github.com/russmedia/terraform-google-kubernetes-serviceaccount?ref=0.1.0"
  project     = "your-google-project"
  role        = "roles/cloudsql.client"
  environment = "production"
  name-prefix = "tf-"
  namespace   = "default"
}
```

and see a plan with following command `terraform plan --out=.tfplan`. In case the output looks good you can apply with `terraform apply ".tfplan"`. This module will create a service account, key, and a kubernetes secret in a chosen namespace.


## 3. Authors

- [Eryk Zalejski](https://github.com/ezalejski)

- [Filip Haftek](https://github.com/filiphaftek)

## 4. License

This project is licensed under the MIT License - see the ([LICENSE.md](LICENSE.md))) file for details.
Copyright (c) 2018 Russmedia GmbH.
