# provider variable
variable "play_token" {
  type = string
  description = "Digitalocean api token to access your account"
}

variable "public_ssh_key" {
  type = string
  description = "Public ssh_key"
}

variable "private_key" {
  type =  string
  description = "Private_key"
}