locals {
  droplet_fqdn = join(".", [var.dns_record, var.dns_zone])
}

module "do_ssh_keys" {
  source = "github.com/hleb-rubanau/terraform-module-digitalocean-ssh-key-ids"
  keys   = var.ssh_key_names
}

resource "digitalocean_droplet" "server" {
  name = local.droplet_fqdn

  image  = var.image
  region = var.region
  size   = var.size

  ssh_keys  = values(module.do_ssh_keys.data)[*].id
  user_data = var.user_data
}

resource "digitalocean_record" "dns" {
  name   = var.dns_record
  domain = var.dns_zone
  ttl    = var.dns_ttl

  type = "A"

  value = digitalocean_droplet.server.ipv4_address
}


