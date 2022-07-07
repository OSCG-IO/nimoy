
source env.sh

if [ $# -ne 1 ] && [ $# -ne 2 ]; then
  echo "ERROR! Must supply node name & optional num warehouses"
  exit 1
fi

node=$1

dump_file=$dump_dir/dump.sql
RESTORE="psql -U postgres -h $node demo -f $dump_file"

echo ""
ls -sh $dump_file
echo ""
echo "$RESTORE"
~/bigsql/pg11/bin/$RESTORE
rc=$?

echo ""
~/bigsql/pg11/bin/psql -U postgres -h $node -c "select count(*) from bmsql_oorder" demo
echo ""
exit $rc

