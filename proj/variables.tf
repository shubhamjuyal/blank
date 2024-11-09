variable "region" {}
variable "instance_type" {}
variable "ami_id" {}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "db_password" {
  description = "Password for PostgreSQL user"
  type        = string
  #   sensitive   = true
}
