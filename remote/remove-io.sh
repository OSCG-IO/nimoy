PSSH="pssh -i -h hosts"

cmd="/db/bigsql/apg stop"
echo "# $cmd"
$PSSH "$cmd"

cmd="rm -rf /db/bigsql"
echo "# $cmd"
$PSSH "$cmd"

