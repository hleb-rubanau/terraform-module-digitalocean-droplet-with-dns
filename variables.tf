variable "ssh_key_names" {
  type    = list(string)
  default = []
}

variable "region" {}
variable "user_data" { default = "" }
variable "dns_zone" {}
variable "dns_record" {}
variable "dns_ttl" { default = 60 }
variable "image" { default = "ubuntu-20-04-x64" }
variable "size" { default = "s-1vcpu-1gb" }

