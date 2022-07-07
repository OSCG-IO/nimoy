
source env.sh

./bms-restore.sh $NODE1 
./bms-spock-create-node.sh $NODE1_IP
./bms-restore.sh $NODE2
./bms-spock-create-node.sh $NODE2_IP
./bms-subscribe-nodes.sh
