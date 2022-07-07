
if [ $# -ne 2 ]; then
  echo "ERROR: two parms required"
  exit 1
fi

whse=$1
dist=$2

key=bmsql/whse-$whse-dist-$dist
cur_val=`etcdctl --endpoints  "default,http://etcd1:2379,http://etcd1:2379,http://etcd3:2379" get $key 2>/dev/null`

if [ "$cur_val" == "" ]; then
  cur_val=3001
fi

let "next_val = $cur_val + 1"
etcdctl --endpoints  "default,http://etcd1:2379,http://etcd1:2379,http://etcd3:2379" set $key $next_val >/dev/null
echo "$cur_val"

exit 0

