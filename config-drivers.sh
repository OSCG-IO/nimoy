
if [ ! -f cluster-def.sh ]; then
  echo "ERROR: missing 'cluster-def.sh' file"
  exit 1
fi

source ./cluster-def.sh

./my-driver.sh ./cluster-def.sh driver1-1 $key1 $ssh_d1

if [ ! "$ip_d2" == "none" ]; then
  ./my-driver.sh ./cluster-def.sh driver2-1 $key2 $ssh_d2
fi

rm -f /tmp/d1-id_rsa.pub
scp -i $key1 $ssh_d1:~/.ssh/id_rsa.pub /tmp/d1-id_rsa.pub

scp -i $key1 /tmp/d1-id_rsa.pub $ssh_n1:~/.ssh/.
ssh -i $key1 $ssh_n1 "cd .ssh; cat d1-id_rsa.pub >> authorized_keys"

if [ ! "$ip_d2" == "none" ]; then
  scp -i $key2 /tmp/d1-id_rsa.pub $ssh_n2:~/.ssh/.
  ssh -i $key2 $ssh_n2 "cd .ssh; cat d1-id_rsa.pub >> authorized_keys"
fi


