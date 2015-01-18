#! /bin/bash
ps -ef | grep conky | grep -v bash | grep -v grep | cut -d " " -f 5 | xargs kill -9


echo "Starting conky..."
conky -c /home/sajith/scratch/myconfigs/conky/.conkyrc-system &
conky -c /home/sajith/scratch/myconfigs/conky/.conkyrc-task &

