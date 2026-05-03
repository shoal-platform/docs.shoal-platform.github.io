# Crontab Expressions

The Shoal scheduler node uses standard **crontab expressions** to define when your container should run. If you've ever set up a scheduled task on a Linux server, it's exactly the same syntax.

---

## How it works

A crontab expression is made up of five fields, each representing a unit of time. Together they define a schedule.

```
┌─────────── minute        (0 - 59)
│ ┌───────── hour          (0 - 23)
│ │ ┌─────── day of month  (1 - 31)
│ │ │ ┌───── month         (1 - 12)
│ │ │ │ ┌─── day of week   (0 - 6, Sunday = 0)
│ │ │ │ │
* * * * *
```

A `*` means "every" - so `* * * * *` means "every minute of every hour of every day".

---

## Common examples

| Expression | Runs... |
|---|---|
| `* * * * *` | Every minute |
| `0 * * * *` | Every hour, on the hour |
| `0 9 * * *` | Every day at 9:00am |
| `0 9 * * 1` | Every Monday at 9:00am |
| `0 9 1 * *` | First day of every month at 9:00am |
| `*/15 * * * *` | Every 15 minutes |
| `0 8,17 * * *` | Every day at 8:00am and 5:00pm |
| `0 9 * * 1-5` | Weekdays (Mon-Fri) at 9:00am |
| `0 0 * * 0` | Every Sunday at midnight |
| `30 23 * * *` | Every day at 11:30pm |

---

## Special characters

| Character | Meaning | Example |
|---|---|---|
| `*` | Every value | `* * * * *` - every minute |
| `,` | List of values | `0 8,17 * * *` - at 8am and 5pm |
| `-` | Range of values | `0 9 * * 1-5` - Mon to Fri |
| `*/n` | Every nth value | `*/15 * * * *` - every 15 minutes |

---

## Not sure of your expression?

!!! tip "Use crontab.guru to build and test expressions"
    [crontab.guru](https://crontab.guru/){ target="_blank" } is a free interactive editor that translates crontab expressions into plain English as you type. Paste in an expression and it tells you exactly when it will run - and how long until the next trigger.

    It's the quickest way to verify your schedule before you deploy.

    **Example:** paste in `0 9 * * 1-5` and it will tell you: *"At 09:00 on every day-of-week from Monday through Friday."*
