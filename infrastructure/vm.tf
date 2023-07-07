resource "proxmox_vm_qemu" "vm" {
    for_each                  = var.vm

    name                      = each.key
    vmid                      = each.value.vmid
    cores                     = each.value.cores
    memory                    = each.value.memory
    agent                     = 0
    boot                      = "order=net0"
    pxe                       = true
    target_node               = "pve"

    network {
        bridge    = "vmbr1"
        firewall  = false
        link_down = false
        model     = "virtio"
        macaddr   = each.value.mac
    }

    onboot      = false
    oncreate    = true    
    hotplug     = "network"
    #hotplug     = "network,disk,cpu,memory"         

    lifecycle {
        ignore_changes = [
          qemu_os,
        ]
  }

}