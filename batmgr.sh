#!/bin/bash
#jaejun.lee.1991@gmail.com

RUN_DIR=$(pwd -P)
DAEMON_NM=run_sched.py

function batch_start() {
    
    if [ -f ${RUN_DIR}/pid ]; then
        echo "Daemon Already Running. if you want to stop or restart, run script stop|restart."
        exit 1
    fi

    nohup /usr/bin/python3 ${RUN_DIR}/${DAEMON_NM} > ${RUN_DIR}/process.log 2>&1 &
    
    PID=`ps -ef | grep ${DAEMON_NM} | grep -v grep | awk '{print $2}'`
    echo ${PID} >> ${RUN_DIR}/pid
    echo "Daemon Run.."
}

function batch_stop() {
    if [ ! -f ${RUN_DIR}/pid ]; then
        echo "Daemon is not Running."
        exit 1
    fi

    PID=$(<${RUN_DIR}/pid)
    kill -9 $PID
    echo "Daemon Stop.."
    
}


function main() {
  case "${1:-}" in
  start)
    batch_start
    ;;
  stop)
    batch_stop
    ;;
  restart)
    batch_stop
    batch_start
    ;;
  *)
    set +x
    echo "usage:" >&2
    echo "    $0 start" >&2
    echo "    $0 stop" >&2
    echo "    $0 restart" >&2
    ;;
  esac
}

main $1