#!/bin/bash

log_file="/storage/emulated/0/network_log.txt"

# Create or clear the log file
echo "Catatan Koneksi - $(date)" > $log_file

while true; do
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    ping -c 5 quiz.int.vidio.com > /dev/null
    ping_status=$?

    if [ $ping_status -ne 0 ]; then
        echo "$timestamp - Ping gagal. Mengaktifkan mode pesawat..." | tee -a $log_file
        su -c 'settings put global airplane_mode_on 1'
        su -c 'am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true'
        echo "$timestamp - Mode pesawat telah diaktifkan" | tee -a $log_file

        sleep 8

        echo "$timestamp - Nonaktifkan mode pesawat..." | tee -a $log_file
        su -c 'settings put global airplane_mode_on 0'
        su -c 'am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false'
        echo "$timestamp - Mode pesawat dimatikan" | tee -a $log_file

        echo "$timestamp - Mengaktifkan ulang data seluler..." | tee -a $log_file
        su -c 'svc data enable'
        echo "$timestamp - Data seluler telah diaktifkan" | tee -a $log_file

        echo "$timestamp - Menunggu 5 detik sebelum melakukan ping kembali..." | tee -a $log_file
        sleep 5
    fi

    if ! curl --silent --head http://quiz.int.vidio.com | grep "200 OK" > /dev/null; then
        echo "$timestamp - Koneksi data tidak berfungsi. Mengaktifkan mode pesawat..." | tee -a $log_file
        su -c 'settings put global airplane_mode_on 1'
        su -c 'am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true'
        echo "$timestamp - Mode pesawat telah diaktifkan" | tee -a $log_file

        sleep 8

        echo "$timestamp - Nonaktifkan mode pesawat..." | tee -a $log_file
        su -c 'settings put global airplane_mode_on 0'
        su -c 'am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false'
        echo "$timestamp - Mode pesawat telah dimatikan" | tee -a $log_file

        echo "$timestamp - Mengaktifkan ulang data seluler..." | tee -a $log_file
        su -c 'svc data enable'
        echo "$timestamp - Data seluler telah diaktifkan" | tee -a $log_file

        echo "$timestamp - Menunggu 5 detik sebelum melakukan ping kembali..." | tee -a $log_file
        sleep 5
    fi

    sleep 1
done