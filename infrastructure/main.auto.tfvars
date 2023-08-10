lxc = {
  pxe = {
    vmid     = "400"
    cores    = "2"
    memory   = "4096"
    swap     = "4096"
    size     = "128GB"
    ip       = "192.168.1.100/24"
    boot     = "true"
  }
}

vm = {
  lb01 = {
    vmid     = "491"
    cores    = "2"
    memory   = "4096"
    mac      = "12:34:56:78:90:1B"
  }  
  lb02 = {
    vmid     = "492"
    cores    = "2"
    memory   = "4096"
    mac      = "12:34:56:78:90:1C"
  } 
  srv01 = {
    vmid     = "411"
    cores    = "2"
    memory   = "8192"
    mac      = "12:34:56:78:90:AB"
  }
  srv02 = {
    vmid     = "412"
    cores    = "2"
    memory   = "8192"
    mac      = "12:34:56:78:90:AC"
  }
  srv03 = {
    vmid     = "413"
    cores    = "2"
    memory   = "8192"
    mac      = "12:34:56:78:90:AD"
  }
  srv04 = {
    vmid     = "414"
    cores    = "2"
    memory   = "8192"
    mac      = "12:34:56:78:90:AE"
  }
}