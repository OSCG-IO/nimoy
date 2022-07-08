# make sure you can login with passwordless cleanly
ssh node1-1 -t whoami
ssh node2-1 -t whoami

# delete and re-install bigsql
./remove-bigsql.sh
sleep 2
./install-bigsql.sh
sleep 2
./setup.sh

