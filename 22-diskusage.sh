#!/bin/bash
DISK_USAGE=$(df -hT|grep xfs)
DISK_THRESHOLD=5 #IN REAL PROJECTS IT IS MORE THAN 755

while IFS= read -r file # IFS internal field separator, empty it will ignore while space. -r for not  to ignore special characters like /#
do
   USAGE=$( echo $file|grep xfs|awk -F " " '{print $6F}'|cut -d  "%" -f1)
   PARTITION=$(echo $file|grep xfs|awk -F " " '{print $NF}')

   if [ $USAGE -gt $DISK_THRESHOLD ]
   then 
       echo "$PARTITION is more than $DISK_THRESHOLD, current value is $USAGE.. Please check and clear"
   fi
done <<< $DISK_USAGE