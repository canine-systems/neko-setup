terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }

  /*
  backend "s3" {
    key                         = "state/terraform.tfstate"
    bucket                      = ""
    region                      = "us-east-1"
    endpoint                    = "https://spaces_endpoint"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
*/
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "magnus" {
  name = "kayila@magnus.fox"
}

data "digitalocean_ssh_key" "cerberus" {
  name = "puppy@cerberus.fox"
}
