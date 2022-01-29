# --- root/variables.tf ---

variable "aws_region" {
  default = "us-west-2"
}

variable "access_ip" {
  type = string
}

# --- database/variables.tf ---

variable "dbuser" {
  type = string
}

variable "dbname" {
  type      = string
  sensitive = true
}

variable "dbpassword" {
  type      = string
  sensitive = true
}