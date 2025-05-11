variable "algorithm" {
  description = "This is the key algorithm"
  default = "RSA"
}

variable "rsa_bits" {
  description = "define rsa bits value"
  default = 2048
}

variable "key_pair_name" {
  description = "This is the key pair name example key2025"
}

variable "file_permission" {
  description = "specifies file permission"
  default = 400
}

variable "profile" {
  description = "specify aws-cli profile"
  default = "default"
}