output "vm_name" {
  value = "terraform-docker-vm"
}

output "application_url" {
  value = "http://localhost:8080"
}

output "vm_id" {
  value = null_resource.docker_vm.id
}