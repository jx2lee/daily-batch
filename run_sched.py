from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.triggers.cron import CronTrigger
from pytz import timezone
from datetime import datetime
import time

def daily_job():
    today = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f'{today} test..')
    with open(f'{today}.csv', 'w') as f:
        f.write(today)


sched = BackgroundScheduler()
sched.start()
sched.add_job(daily_job, CronTrigger.from_crontab("1 0 * * *"), id="test")

while True:
    time.sleep(1)