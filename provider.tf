# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
   account_id =3627500
  api_key = "NRAK-A7QTJY3NOV9VF3HCAAU2UVJB7PX"    # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}