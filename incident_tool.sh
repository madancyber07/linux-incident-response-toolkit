#!/bin/bash
system_information() {

}

logged_in_users() {

}

user_group_information() {

}

running_processes() {

}

network_information() {

}

disk_memory_usage() {

}

file_permission_audit() {

}

backup_files() {

}

generate_incident_report() {

}
system_information() {
echo "===== System Information ====="

hostname
whoami
uname -a
uptime
date
}
logged_in_users() {

echo "===== Logged In Users ====="

whoami
who
w

}
user_group_information() {

echo "===== User & Group Information ====="

id
groups

}
running_processes() {

echo "===== Running Processes ====="

ps aux --sort=-%cpu | head

}
network_information() {

echo "===== Network Information ====="

hostname -I

ip addr

cat /etc/resolv.conf

ssh -V

}
disk_memory_usage() {

echo "===== Disk & Memory Usage ====="

df -h

free -h

}
file_permission_audit() {

echo "===== File Permission Audit ====="

ls -l

find . -perm -002

}
backup_files() {

read -p "Enter Folder Name: " folder

tar -czvf backups/$folder.tar.gz $folder

}
generate_incident_report() {

REPORT=reports/report_$(date +%Y%m%d_%H%M).txt

echo "Linux Incident Report" > $REPORT

echo >> $REPORT

hostname >> $REPORT

whoami >> $REPORT

date >> $REPORT

df -h >> $REPORT

free -h >> $REPORT

hostname -I >> $REPORT

who >> $REPORT

ps aux | head >> $REPORT

echo "Report Generated Successfully."

}
while true
do

clear

echo "======================================="
echo " Linux Incident Response Toolkit"
echo "======================================="
echo
echo "1. System Information"
echo "2. Logged-in Users"
echo "3. User & Group Information"
echo "4. Running Processes"
echo "5. Network Information"
echo "6. Disk & Memory Usage"
echo "7. File Permission Audit"
echo "8. Backup Important Files"
echo "9. Generate Incident Report"
echo "10. Exit"
echo

read -p "Enter Choice: " choice
case $choice in

1)
system_information
;;

2)
logged_in_users
;;

3)
user_group_information
;;

4)
running_processes
;;

5)
network_information
;;

6)
disk_memory_usage
;;

7)
file_permission_audit
;;

8)
backup_files
;;

9)
generate_incident_report
;;

10)
exit
;;

*)
echo "Invalid Choice"
;;

esac

echo
read -p "Press Enter..."

done
