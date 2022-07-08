PSSH="pssh -i -h hosts"

$PSSH 'cd /db; python -c "$(curl -fsSL https://bigsql-download.s3.amazonaws.com/REPO/install.py)"'

