#!/bin/bash
DISK_USAGE=$(df -hT|grep xfs)
DISK_THRESHOLD=5 #IN REAL PROJECTS IT IS MORE THAN 755

while IFS= read -r file # IFS internal field separator, empty it will ignore while space. -r for not  to ignore special characters like /#
do
   echo "Deleting file : $file"
   rm -rf $file
done <<< $DISK_USAGE