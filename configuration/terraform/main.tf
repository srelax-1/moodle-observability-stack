resource "digitalocean_ssh_key" "webserver_key" {
  name       = "moodle_webserver_key"
  public_key = file(var.public_ssh_key)
}

resource "digitalocean_droplet" "moodle_web_server" {
  name     = "moodle-web-1"
  image    = "ubuntu-24-04-x64"
  region   = "nyc3"
  size     = "s-2vcpu-2gb"
  ssh_keys = [digitalocean_ssh_key.webserver_key.fingerprint]

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.private_key)
    timeout = "2m"
  }
  user_data = <<EOF
    package_update: true
    package_upgrade: true
    packages:
      - nginx
      - php-fpm
      - php-cli 
      - php-mysql 
      - php-curl 
      - php-gd 
      - php-mbstring 
      - php-xml 
      - php-zip
    runcmd:
      - systemctl enable nginx
      - systemctl start nginx
      - systemctl enable php-fpm
      - systemctl start php-fpm
  EOF
}

resource "digitalocean_project" "moodle_observability" {
  name        = "moodle-observability"
  description = "A hands-on observability project to learn SRE fundamentals through real-world monitoring, logging, and distributed tracing."
  purpose     = "It's to host the moodle application"
  environment = "Development"
  resources = [digitalocean_droplet.moodle_web_server.urn]
}