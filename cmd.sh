#!/bin/sh

set -e

echo "starting docker daemon"
nohup dockerd \
  --host=unix:///var/run/docker.sock \
  --storage-driver=overlay2 &

# poll for docker daemon up
max_retries=6
n=0
until [ $n -gt $max_retries ]
do
  docker ps > /dev/null 2>&1 && break
  n=$((n+1))
  sleep 1
done

if [ "$n" -gt "$max_retries" ]; then
  # assume failed
  cat nohup.out
  exit 1
fi

echo "connecting to swarm $SWARM_NAME as $DOCKER_USER"
result=$(/client)
export "${result##* }"

dockerCmd="docker stack deploy"

# handle opts
if [ "$stackFileType" == "compose" ]; then
    dockerCmd=$(printf "%s --compose-file %s" "$dockerCmd" "/stackFile")
else
    dockerCmd=$(printf "%s --bundle-file %s" "$dockerCmd" "/stackFile")
fi

if [ "$prune" == "true" ]; then
    dockerCmd=$(printf "%s --prune" "$dockerCmd")
fi

dockerCmd=$(printf "%s %s" "$dockerCmd" "$stackName")

eval "$dockerCmd"
