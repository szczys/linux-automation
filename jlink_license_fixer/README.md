# Fix SEGGER nag-ware

When using the J-Link binary on an NXP board (1024, 1060, etc.), the SEGGER
tools will pop up a GUI once per day requiring you to agree to the license.
After agreeing one time (to place files in your home directory), running this
script via daily cron job will prevent this pop-up from being shown in the
future.

```

```
