
this_dir=`pwd`
RUN=$this_dir/benchmarksql/run
PSSH="pssh -i -h hosts"
PSCP="pscp -h hosts"
pgXX=pg14
IO_DIR=/db/oscg
io=$IO_DIR/io
PG=$IO_DIR/$pgXX
psql="$PG/bin/psql -U postgres"

DRIVER1=
NODE1=
NODE1_IP=

DRIVER2=
NODE2=
NODE2_IP=

dump_dir=/home/ec2-user/test/data

