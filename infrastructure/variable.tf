variable "proxmox_api_url" {}
variable "proxmox_api_token_id" {}
variable "proxmox_api_token_secret" {}
variable "lcx_root_passwd" {} 

variable "lxc" {
    type = map(object({
        vmid   = string
        cores  = string
        memory = string
        swap   = string 
        size   = string
        ip     = string
        boot   = string
    }))
}

variable "vm" {
    type = map(object({
        vmid   = string
        cores  = string
        memory = string
        mac    = string
    }))
}