# Daily batch job using Python

This repo is for Daily batch job using Python. Job Process is based Python, Controll shell script. *(batmgr.sh)*

## How to Use

### Preperation

Install Python Package. For example:  
`pip install -r requirements.txt`

**run_sched.py**:  
* `daily_job function`: Write what you want to do. The example writes a file of the time the job was performed.
* uses Crontab Expression. if you want edit that, modify `CronTrigger.from_crontab({to_edit_Crontab_Expressions})` in `.py`

### Usage

Use `batmgr.sh`. For example:
```bash
$ ./batmgr.sh
usage:
    ./batmgr.sh start
    ./batmgr.sh stop
    ./batmgr.sh restart
```

* **start**: start batch process
```bash
$ ./batmgr.sh start
Daemon Run..
$ cat pid
10595
$ cat process.log
$ ps -ef |grep 10595
jovyan   10595     1  1 22:21 pts/0    00:00:00 /usr/bin/python3 /home/jovyan/daily-batch/run_sched.py
jovyan   10606 10471  0 22:21 pts/0    00:00:00 grep --color=auto 10595
```

* **stop**: stop batch process
    * Stop python process and delete pid & process.log
```bash
$ ./batmgr.sh stop
Daemon Stop..
$ ll
total 5
drwxr-xr-x  3 jovyan users    25396 Oct  3 22:26 ./
drwxrwxrwx 11 root   root  88166353 Oct  3 21:55 ../
-rwxr-xr-x  1 jovyan users     1030 Oct  3 21:56 batmgr.sh*
drwxr-xr-x  8 jovyan users    23787 Oct  3 21:56 .git/
-rw-r--r--  1 jovyan users       24 Oct  3 21:56 .gitignore
-rw-r--r--  1 jovyan users        0 Oct  3 21:56 README.md
-rw-r--r--  1 jovyan users      555 Oct  3 21:56 run_sched.py
$ ps -ef |grep 10595
jovyan   10613 10471  0 22:26 pts/0    00:00:00 grep --color=auto 10595
```

* **restart**: restart batch process
    * Restart batch process
```bash
$ ./batmgr.sh restart
Daemon Stop..
Daemon Run..
$ ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
jovyan       1     0  0 Sep16 ?        00:00:48 tini -- sh -c jupyter notebook --notebook-dir=/home/${NB_USER} --ip=0.0.0.0 --no-browser --allow-root --port=8888 --Notebo
jovyan       7     1  0 Sep16 ?        00:00:00 sh -c jupyter notebook --notebook-dir=/home/${NB_USER} --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.to
jovyan       8     7  0 Sep16 ?        00:02:56 /usr/bin/python3 /usr/local/bin/jupyter-notebook --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --allow-root --port
jovyan    9771     8  0 Sep16 ?        00:01:17 /usr/bin/python3 -m ipykernel_launcher -f /home/jovyan/.local/share/jupyter/runtime/kernel-a16d4f31-0579-448d-8694-4fd2ed2
jovyan   10471     0  0 21:52 pts/0    00:00:00 bash
jovyan   10630     1  4 22:27 pts/0    00:00:00 /usr/bin/python3 /home/jovyan/daily-batch/run_sched.py
jovyan   10638 10471  0 22:27 pts/0    00:00:00 ps -ef
$ ll
total 5
drwxr-xr-x  3 jovyan users    25396 Oct  3 22:27 ./
drwxrwxrwx 11 root   root  88166353 Oct  3 21:55 ../
-rwxr-xr-x  1 jovyan users     1030 Oct  3 21:56 batmgr.sh*
drwxr-xr-x  8 jovyan users    23787 Oct  3 21:56 .git/
-rw-r--r--  1 jovyan users       24 Oct  3 21:56 .gitignore
-rw-r--r--  1 jovyan users        6 Oct  3 22:27 pid
-rw-r--r--  1 jovyan users        0 Oct  3 22:27 process.log
-rw-r--r--  1 jovyan users        0 Oct  3 21:56 README.md
-rw-r--r--  1 jovyan users      555 Oct  3 21:56 run_sched.py
$ cat pid
10630
$ ps -ef | grep 10630
jovyan   10630     1  1 22:27 pts/0    00:00:00 /usr/bin/python3 /home/jovyan/daily-batch/run_sched.py
jovyan   10642 10471  0 22:28 pts/0    00:00:00 grep --color=auto 10630
```

# Reference
* [https://medium.com/@HatusneMiku3939/리눅스-데몬-만들기-python-1-3c5ea10c6366](https://medium.com/@HatusneMiku3939/리눅스-데몬-만들기-python-1-3c5ea10c6366)
* [http://openuiz.blogspot.com/2018/08/python.html](http://openuiz.blogspot.com/2018/08/python.html)



---
made by *jaejun.lee*%