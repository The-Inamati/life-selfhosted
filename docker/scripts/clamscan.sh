#!/bin/bash
BEGIN=$(date +'%H:%M:%S_%d-%m')
LOGFILE="/tmp/clamscan_log_"$BEGIN".txt";
EMAIL_TO="webmaster@example.com";
DIRTOSCAN="/home/USER";

for S in ${DIRTOSCAN}; do

DIRSIZE=$(du -sh "$S" 2>/dev/null | cut -f1);

echo "Starting a daily scan of "$S" directory.
Amount of data to be scanned is "$DIRSIZE".";

clamscan -ri "$S" >> "$LOGFILE";

# get the value of "Infected lines"

VIRUS=$(tail "$LOGFILE"|grep Infected|cut -d" " -f3);
END=$(date +'%H:%M:%S_%d-%m')
EMAIL_MSG="Virus scan for directory $S started at $BEGIN and ended at $END. Please see the log file attached for more information."

if [ "$VIRUS" -ne "0" ];then
echo "$EMAIL_MSG" | mutt -s "Virus Found" "$EMAIL_TO" -a "$LOGFILE"
fi
echo "$EMAIL_MSG" | mutt -s "Virus Scan Successfull" "$EMAIL_TO" -a "$LOGFILE"
rm $LOGFILE
done
exit 0