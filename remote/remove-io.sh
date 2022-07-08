PSSH="pssh -i -h hosts"

cmd="/db/oscg/io stop"
echo "# $cmd"
$PSSH "$cmd"

cmd="rm -rf /db/oscg"
echo "# $cmd"
$PSSH "$cmd"

