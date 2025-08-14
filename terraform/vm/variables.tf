variable "proxmox_api_url" {
    type = string
    description = "The URL of the Proxmox API"
    default = "https://node1.proxmox.local/api2/json"
}

variable "proxmox_api_token_id" {
    type = string
    description = "The ID of the Proxmox API token"
    default = "user@pam!proxmox"
}

variable "proxmox_api_token_secret" {
    type = string
    description = "The secret of the Proxmox API token"
    default = "12354678759845734623524675"
}

variable "proxmox_tls_insecure" {
    type = bool
    description = "Whether to allow insecure TLS connections"
    default = true
}

variable "proxmox_node" {
    type = string
    description = "The node to deploy the VM on"
    default = "pve01"
}

variable "vm_name" {
    type = string
    description = "The name of the VM"
    default = "vm-tst-01"
}

variable "vm_disk_size" {
    type = string
    description = "The size of the VM disk"
    default = "16G"
}