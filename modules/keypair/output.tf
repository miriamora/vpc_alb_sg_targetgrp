output "key_name" {
  value = aws_key_pair.key_pair.key_name
}

output "pem_key_name" {
  value = local_file.name.filename
}