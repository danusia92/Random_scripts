#!/bin/bash
#exit the script if it is not run as root
now="$(date)"
free="$(free -m)"
boot="$(who -b)"

if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

#print the current (system) date
echo "Current date"
echo "$now"

#print only the free memory amount
echo "Free memory amount"
echo "$free"

#print the users created, their home dir and shell
cat /etc/passwd | grep [123456789][1234567890][1234567890][1234567890] | cut -d ":" -f1,6,7

#print account expiry
for i in user03 user11 userff
do
	echo "User $i account expires "
	chage -l $i | grep "Account"
done

#print last boot time
echo "This is the last boot time"
echo "$boot"

#print last 10 commands

#Print the number of files that end in 11
find / -type f -name "*11" | wc

#copy all files that end in 11
find / -type f -name "*11" > /root/files_that_end_in_11

#find all files owned by user03
for x in user03
do
	echo "All files owned by user03"
	find / -user $x
done

#print a reverse sort of the first 10 processes
ps aux | head | sort -r
