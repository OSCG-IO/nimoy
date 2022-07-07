
env=$1
echo "1 env=$env"
driver=$2
echo "2 driver=$driver"
pem=$3
echo "3 pem=$pem"
vm=$4
echo "4 vm=$vm"

function echoCmd {
  echo ""
  echo "$1"
  $1
}

if [ ! "$#" == "4" ]; then
  echo "ERROR: must be exactly four parameters"
  exit 1
fi

echoCmd "scp -i $pem $env $vm:env.sh"
echoCmd "scp -i $pem yum-driver.sh $vm:."

cmd="chmod 755 ~/*.sh"
echoCmd "ssh -i $pem -t $vm $cmd; ./yum-driver.sh $driver"

echoCmd "scp -i $pem $env $vm:test/nimoy/remote/env.sh"

exit 0

