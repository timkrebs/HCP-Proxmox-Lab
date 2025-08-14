terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.2-rc03"
    }
  }
}

provider "proxmox" {
    pm_api_url= var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_token_secret
    pm_tls_insecure = true
}

# Create a new VM instance
resource "proxmox_vm_qemu" "vm_instance" {
    name = var.vm_name
    target_node = var.proxmox_node
    clone = "ubuntu-server-2404-template"
    full_clone = true
    cpu { cores = 2}
    memory = 2048

    disk {
        size = var.vm_disk_size
        type = "disk"
        storage = "local-lvm"
        discard = true
        slot = "scsi0"
    }
    network {
        id = 0
        bridge    = "vmbr0"
        firewall  = false
        link_down = false
        model     = "virtio"
    }
}
