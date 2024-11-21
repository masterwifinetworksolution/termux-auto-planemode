# Termux Auto Plane Mode

Kini `Simaster` telah meluncurkan terobosan terbaru bagi `koneksi data` anda yang sering terputus.

Dan script ini di khususkan bagi perangkat android anda yang sudah `root`. Entah itu yang anda gunakan `magisk` atau pun `supersu`.

Untuk pemasangan script ini, anda hanya memerlukan 3 bahan saja.

1. **Termux**.
2. **Termux:Boot**.
3. **MT Manager** atau **File Manager Root** unggulan anda.
4. Script **Termux Auto Plane Mode**.

Ikuti tahapan demi tahapan yang akan saya jelaskan secara detail dan saya harap agar tidak di lewatkan sedikitpun karena sangat penting sekali.

## Installasi

1. Silahkan kumpulkan bahan yang sudah saya siapkan untuk anda semua. yang pertama adalah [Termux](https://f-droid.org/repo/com.termux_1020.apk), lalu yang kedua [Termux Boot](https://f-droid.org/repo/com.termux.boot_1000.apk), dan yang ketiga adalah script [Auto Plane Mode](https://github.com/masterwifinetworksolution/termux-auto-planemode/archive/refs/heads/main.zip).
2. Install `Termux`, `Termux Boot`, dan `File Manager Root`.
3. Berikan akses izin di `Magisk` untuk `Termux`, `Termux Boot`, dan `File Manager Root` anda.
4. Silahkan buka terlebih dahulu `Termux` lalu masuk pengaturan dengan menekan tombol gear atau icon setting dan aktifkan semua yang ada disana. Kemudian berikan perintah:

```
termux-setup-storage
```

Kemudian berikan akses izin agar nanti bisa masuk ke folder memori internal di android anda.

5. Setelah itu, silahkan masuk ke aplikasi `Termux Boot`. Nanti secara otomatis akan aktif untuk `crontab` atau `cronjob` di folder `/data/data/com.termux/files/home/.termux/boot`.
6. Jika sudah, kita masuk ke `File Manager` untuk ekstrak file Script `Termux-Auto-Planemode-master.zip`.
7. Sesudah ekstrak, masuk dan ambil beberapa file yaitu `ping_loop.sh`, `ping_loop.pid`, `ping_loop.log`, `network_log.txt`, dan `control_ping_loop.js`. Taruh di `/storage/emulated/0/` atau istilahnya memori internal anda.
8. Untuk file `autostart.sh` taruh di `/data/data/com.termux/files/home`.
9. Kemudian untuk file yang terakhir kita taruh saja di dalam folder `/data/data/com.termux/files/home/.termux/boot`.
10. Berikan permission dulu untuk semua file yang ada di memori internal anda lewat termux.

```
chmod +x /storage/emulated/0/ping_loop.sh
chmod +x /data/data/com.termux/files/home/.termux/boot/start_termux.sh
chmod +x /data/data/com.termux/files/home/autostart.sh
```

11. Setelah memberikan izin akses permission. Anda bisa mengedit ping host sesuai bug andalan yang anda gunakan sehari-hari.
12. Untuk mengubah ping host, anda bisa masuk ke file `ping_loop.sh` di line 11 dan line 35.
13. langkah terakhir ini yang kita nantikan yaitu pengujian. Anda bisa reboot hp android anda melalui magisk atau langsung dari tombol hp android anda.
14. Jika berhasil, maka akan muncul icon termux di notif atas layar android anda dengan tulisan `0 sessions, 1 task`. Namun jika anda gagal, akan ada notifikasi log error di termux anda.
