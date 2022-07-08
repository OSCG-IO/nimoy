PSSH="pssh -i -h hosts"

$PSSH 'cd /db; python3 -c "$(curl -fsSL https://oscg-io-download.s3.amazonaws.com/REPO/install.py)"'

