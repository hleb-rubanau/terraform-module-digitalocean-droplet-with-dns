# About this module

This terraform module is used to support a common use-case: provision of digitalocean droplet with attached DNS record.

See [variables](./variables.tf) for the list of supported parameters and defaults

# Requirements

* Terraform of version 0.12

# Opinionated decisions

* Module assigns the full domain name as the droplet name
* Module uses ephemeral ipv4 address of the droplet as a target for DNS record
* Default TTL of the DNS record is 60 seconds
* Default droplet image is Ubuntu 20.04
* Default droplet size is `s-1vcpu-1gb`

# Usage

```
module "server_with_dns" {
  source = "github.com/hleb-rubanau/terraform-module-digitalocean-droplet-with-dns"

  ssh_key_names = [ "key1", "key2" ]
  user_data = templatefile("${path.module}/cloud_init_template.sh", { param1="val1", param2="val2"  } )
  region        = "lon1"
  dns_zone = "example.com"
  dns_record = "server1" # full droplet name and domain address would be server1.example.com 
  
  ### optional parameters are commented below  
  # dns_ttl=60
  # image = "ubuntu-20-04-x64"
  # size = "s-1vcpu-1gb" 
} 

```
