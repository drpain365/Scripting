sudo apt install net-tools
for i in `sudo netstat -tulpen | grep -v 631 | grep LISTEN | grep -v systemd-resolv | grep -v dnsmasq | grep -v ftp | grep -v ssh | grep -v apache2 | awk '{print $9F}' | awk '!a[$0]++' | cut -d "/" -f1`; do lsof 2>&1 | grep -w $i | grep -w txt | awk '{print $9F}'; done 
for i in `ls /var/spool/cron/crontabs`; do if cat /var/spool/cron/crontabs/$i | grep -v '#' | grep '*' > /dev/null ; then echo " "; echo "#####################################"; echo " ";echo /var/spool/cron/crontabs/$i; echo " "; echo "#####################################"; echo " "; fi; cat /var/spool/cron/crontabs/$i | grep -v '#' | grep '*'; echo " "; done
#Make sure to check rc.local, malicious files in /etc/cron.d/<filename>, /var/spool/cron/crontabs, /etc/crontab, others
