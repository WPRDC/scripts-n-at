# notify.py

This script sends the given message to the #notifications channel on the WPRDC Slack.

> Note that this shouldn't be heavily used (e.g., for reporting every error a script encounters)
> as API limits are a consideration. This script IS suitable for running when a script-terminating
> exception is caught, so that you can report the irregular termination of an ETL script.

