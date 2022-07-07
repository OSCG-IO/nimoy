source env.sh

function echoCmd {
  echo "# $1"
  $1
  rc=$?
  if [ "$rc" == "0" ]; then
    echo ""
  else
    echo "FATAL ERROR!  stopping now"
    exit $rc
  fi
}

echo ""
echo "####### setup.sh ##################"

$PSSH "$apg install $pgXX"
$PSSH "$apg start $pgXX -y -d demo"

$PSSH "$apg tune $pgXX"

echoCmd "$PSCP pg_hba.conf $PG/."

$PSSH "$apg install $spock-pg11 -d demo"

echoCmd "$PSCP create-replication-role.sql $PG/."
$PSSH "$psql -f $PG/create-replication-role.sql"

