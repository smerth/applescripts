set logLines to do shell script "tail -n3 /var/log/system.log"
display dialog logLines