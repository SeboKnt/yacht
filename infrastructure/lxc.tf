resource "proxmox_lxc" "lxc" {
  for_each     = var.lxc

  target_node  = "pve"
  hostname     = each.key
  vmid         = each.value.vmid
  ostemplate   = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password     = var.lcx_root_passwd
  start        = true
  onboot       = each.value.boot
  unprivileged = false

  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMrrBNGlDWTze5AmaQbLgJItNUiu1E9macSwa8oqvXuZ user@fedora.fritz.box
  EOT

  cores        = each.value.cores
  memory       = each.value.memory
  swap         = each.value.swap

  rootfs {
    storage    = "local-lvm"
    size       = each.value.size
  }

  lifecycle {
    ignore_changes = [
      rootfs[0].size,
    ]
  }
  

  network {
    name   = "eth0"
    bridge = "vmbr1"
    gw     = "192.168.1.1"
    ip     = each.value.ip
    ip6    = "auto"
  }

}