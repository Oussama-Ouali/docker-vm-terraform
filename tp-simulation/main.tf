terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

resource "null_resource" "docker_vm" {

  triggers = {
    vagrantfile = filesha256("${path.module}/Vagrantfile")
    script      = filesha256("${path.module}/scripts/install-docker.sh")
    project_dir = abspath(path.module)
  }

  provisioner "local-exec" {
    command     = "vagrant up --provider=virtualbox"
    working_dir = path.module
  }

  provisioner "local-exec" {
    when    = destroy
    command = "cd '${self.triggers.project_dir}' && vagrant destroy -f"
  }
}