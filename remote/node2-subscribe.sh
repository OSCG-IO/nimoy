
source env.sh

PSQL="/home/ec2-user/bigsql/pg11/bin/psql -U postgres  -h $NODE2 demo"

$PSQL -c "SELECT $spock.create_subscription( \
    subscription_name := 'subscription1', \
    provider_dsn := 'host=$NODE1_IP port=5432 user=replication password=password dbname=demo', \
    forward_origins := '{}', \
    synchronize_data := false \
);"

$PSQL -c "SELECT $spock.alter_subscription_add_replication_set( \
    subscription_name := 'subscription1', \
    replication_set := 'bmsql_set' \
);"

$PSQL -c "SELECT $spock.wait_for_subscription_sync_complete('subscription1');"

