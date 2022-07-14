# make sure you can login with passwordless cleanly
ssh node1-1 -t whoami
ssh node2-1 -t whoami

# delete and re-install io
./remove-io.sh
sleep 2
./install-io.sh
sleep 2
./setup.sh

