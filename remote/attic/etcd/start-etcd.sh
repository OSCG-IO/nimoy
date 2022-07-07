# start a local etcd server
#driver1=172.31.29.101
driver1=127.0.0.1
etcd --listen-client-urls=http://$driver1:2379 --advertise-client-urls=http://$driver1:2379 &
