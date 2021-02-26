variable "neko_ip" {}
variable "neko_view_password" {}
variable "neko_admin_password" {}

resource "digitalocean_droplet" "neko" {
  image  = "docker-20-04"
  name   = "neko"
  region = "nyc1"
  size   = "s-4vcpu-8gb"
  ssh_keys = [
    data.digitalocean_ssh_key.magnus.id,
    data.digitalocean_ssh_key.cerberus.id
  ]
  user_data = templatefile("${path.module}/user-data.yml", { view_password = var.neko_view_password, admin_password = var.neko_admin_password })
}

data "digitalocean_floating_ip" "neko" {
  ip_address = var.neko_ip
}

resource "digitalocean_floating_ip_assignment" "neko" {
  ip_address = data.digitalocean_floating_ip.neko.ip_address
  droplet_id = digitalocean_droplet.neko.id
}
