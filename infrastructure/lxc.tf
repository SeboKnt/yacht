resource "proxmox_lxc" "lxc" {
  for_each     = var.lxc

  target_node  = "pve"
  hostname     = each.key
  #ostemplate   = "local:vztmpl/alpine-3.18-default_20230607_amd64.tar.xz"
  ostemplate   = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password     = var.lcx_root_passwd
  start        = true
  onboot       = false
  unprivileged = false

  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMrrBNGlDWTze5AmaQbLgJItNUiu1E9macSwa8oqvXuZ user@fedora.fritz.box
  EOT

  vmid         = each.value.vmid
  cores        = each.value.cores
  memory       = each.value.memory
  swap         = each.value.swap

  rootfs {
    storage    = "local-lvm"
    size       = each.value.size
  }

  network {
    name       = "eth0"
    bridge     = "vmbr1"
    #ip         = "dhcp"
    #tag        = "10" ## VLAN ABER FRAG NICHT WIE
    gw         = "192.168.1.1"
    #nameserver = "192.168.1.1" ## gibt es anscheinend nicht lol
    ip         = each.value.ip
    ip6        = "auto"
  }
}