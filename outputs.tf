output "droplet" { value = digitalocean_droplet.server.name }
output "ip_address" { value = digitalocean_droplet.server.ipv4_address }
