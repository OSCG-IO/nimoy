
if [ ! -f cluster-def.sh ]; then
  echo "ERROR: missing 'cluster-def.sh' file"
  exit 1
fi
source ./cluster-def.sh 

./my-node.sh ./cluster-def.sh node1-1 $key1 $ssh_n1
./my-node.sh ./cluster-def.sh node2-1 $key2 $ssh_n2

