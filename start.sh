#!/bin/bash

set -e

# Get directory of setup.sh
export ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make it so that when Ctrl-C'ing this script, all subprocesses get killed
pids=''
expected_pid_count=0
get_pids() {
  if [[ `uname` == 'Darwin' ]]; then
    # OS X
    tree=`(pstree $$)`
    pids=`echo $tree | grep -o '[=-] [0-9]\+' | grep -o '[0-9]\+' | grep -v $$`
    expected_pid_count=3
    #bash, pstree, ps
  else
    # Linux
    tree=`(pstree -p $$)`
    pids=`echo $tree | grep -o '([0-9]\+)' | grep -o '[0-9]\+' | grep -v $$`
    expected_pid_count=2
    #bash, pstree
  fi
}

onexit() {
  echo 'Terminating descendants...'
  for i in {1..100}
  do
    get_pids
    if [[ `echo $pids | wc -w` -le $expected_pid_count ]]; then
      echo 'Exiting with # processes still running:'
      echo $pids | wc -w
      echo Expected at most $expected_pid_count
      break
    fi

    for pid in $pids; do kill $pid 2>/dev/null; done;
    sleep 0.1
  done

  get_pids
  for pid in $pids; do kill -9 $pid 2>/dev/null; done;
}
noop_func() { :; }
trap onexit EXIT
trap noop_func SIGINT SIGTERM INT QUIT TERM

# Start services
pushd $ROOT > /dev/null
  mkdir -p tmp

  # bin/ensure-postgres-socket-dir.sh

  # . bin/kill-descendants-on-exit.sh

  (mysqld --datadir="$ROOT/tmp/mysql" -P '5543'                    || kill $$)  2>&1| perl -pe "s/^/\x1b[0;35m[mysql] \x1b[0m/" &
  (postgres -D 'tmp/postgres' -p '5544' -c 'synchronous_commit=off'|| kill $$)  2>&1| perl -pe "s/^/\x1b[0;35m[postgres] \x1b[0m/" &

  wait
popd > /dev/null
