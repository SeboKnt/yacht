#/bin/bash

known_hosts_file="$HOME/.ssh/known_hosts"
server=("192.168.1.101" "192.168.1.102" "192.168.1.103")

terraform -chdir=./infrastructure/ destroy -auto-approve
terraform -chdir=./infrastructure/ apply -auto-approve

for hosts in "${server[@]}"
do
   ssh-keygen -R "$server"
   #ssh-keyscan -H "$server" >> "$known_hosts_file"
done