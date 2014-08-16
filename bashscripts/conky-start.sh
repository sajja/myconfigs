#! /bin/bash
ps -ef | grep conky | grep -v bash | grep -v grep | cut -d " " -f 5 | xargs kill -9


echo "Starting conky..."
conky -c ../conky/.conkyrc-system &
conky -c ../conky/.conkyrc-task &

