etcdctl --endpoints  "default,http://etcd1:2379,http://etcd1:2379,http://etcd3:2379" rm -r bmsql
etcdctl --endpoints  "default,http://etcd1:2379,http://etcd1:2379,http://etcd3:2379" mkdir bmsql
