# The process to run from driver1-1 instance

1.) ssh to node1-1 and node2-1 to make sure passwordless ssh works without warning

2.) Run refresh-bigsql.sh to start over on each database node.
     - Make sure each node is clean and ready for bigsql remove-bigsql.sh
     - install-bigsql.sh to install bigsql on each node
     - run setup.sh to do following on each node using pssh;
         + use pgc to install/tune pg11 & install spock into the demo db
         + replace pghba.conf with a permissive version for logical rep
         + create the replication role

3) run bms-build-1.sh
        bms-dump-1.sh

4) run bms-setup.sh to:
          bms-restore.sh node1
          bms-spock-create-node.sh node1
          bms-restore2.sh node2
          bms-spock-create-node.sh node2
          bms-subscribe-nodes.sh

5) run "bms-runBenchmark.sh" 

6) rinse & repeat for different size nodes by varying the 
    nodeN-pg.properties file on driver1 & driver2 machines.
    you must make sure that the data that is loaded corrsponds
    to the number of warehouses in the properties file.
