variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

data "digitalocean_image" "arch_linux_001" {
  name = "arch_linux_001"
}

data "digitalocean_ssh_key" "macbook" {
  name = "Macbook"
}

resource "digitalocean_droplet" "playground" {
  image = "${data.digitalocean_image.arch_linux_001.image}"
  name = "playground"
  region = "fra1"
  size = "s-6vcpu-16gb"
  ssh_keys = ["${data.digitalocean_ssh_key.macbook.id}"]

  provisioner "file" {
    source = "./provision.sh"
    destination = "/tmp/provision.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provision.sh",
      "/tmp/provision.sh"
    ]
  }
}

output "playground_id_addr" {
  value = "${digitalocean_droplet.playground.ipv4_address}"
}
