# Laporan Penjelasan dan Penyelesaian Soal Modul 1
## Anggota 
| Nama                      | NRP        |
|---------------------------|------------|
|Muhammad Hikari Reiziq R.  | 5027241079 |
|Dira Muhammad Ilyas S. A.  | 5027241033 |
|Thariq Kyran Aryunaldi     | 5027241073 |

## Soal 1
> Penataan format text dirapikan menggunakan Aplikasi Notion yang kemudian di copy paste 
### Download file csv

```
wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv && echo "File berhasil didownload" || echo "Gagal"
```
Dalam awal mengerjakan kita menggunakan command `Wget` berfungsi untuk mengunduh file dengan format FTP, HTTP maupun HTTPS

> Mantap 
## Soal 1A
```
awk -F',' '$2 ~ /Chris Hemsworth/ {count++} 
END {
	if (count > 0) 
		printf "Chris Hemsworth membaca %d buku\n", count; 
	else 
		print "Tidak ditemukan\n"}' reading_data.csv
```
Penjelasan:
1. **`awk -F','`**
    - **`F','`** berarti menggunakan tanda **koma (`,`)** sebagai pemisah kolom karena file CSV biasanya dipisahkan dengan koma.
    - Setiap kolom bisa diakses dengan **`$1, $2, $3, ...`**.
    - 


# Soal 2

## Daftar Isi
1. [Pendahuluan](#pendahuluan)
2. [Soal 2A - Register](#soal-2a---register)
3. [Soal 2B - Login](#soal-2b---login)
4. [Soal 2C - Validasi Email dan Password](#soal-2c---validasi-email-dan-password)
5. [Soal 2D - Unik Email](#soal-2d---unik-email)
6. [Soal 2E - Hashing Password](#soal-2e---hashing-password)
7. [Soal 2F - Monitoring CPU](#soal-2f---monitoring-cpu)
8. [Soal 2G - Monitoring RAM](#soal-2g---monitoring-ram)
9. [Soal 2H - Crontab Manager](#soal-2h---crontab-manager)
10. [Soal 2I - Log Monitoring](#soal-2i---log-monitoring)
11. [Soal 2J - Terminal Utama](#soal-2j---terminal-utama)
12. [Kesimpulan](#kesimpulan)
13. [Kendala & Perbaikan](#kendala--perbaikan)

---

## Pendahuluan
Dalam dunia "Arcaea", sistem login/register dibutuhkan untuk membedakan antara "Player" dan "Observer" serta mengamankan akses ke dunia tersebut. Sistem ini mencakup:

- **Pembuatan akun** melalui register dan login.
- **Validasi keamanan** untuk memastikan format email benar dan password kuat.
- **Penyimpanan data akun yang aman** menggunakan hashing SHA-256.
- **Pemantauan CPU dan RAM** untuk menjaga kestabilan dunia "Arcaea".
- **Crontab Manager** untuk mengotomatisasi pemantauan sumber daya sistem.
- **Antarmuka utama** untuk mengakses semua fitur dengan mudah.

---

## Soal 2A - Register

### Tujuan
- Membuat sistem registrasi "Player" di dunia "Arcaea".
- Menyimpan informasi akun dalam `player.csv`.

### Implementasi (`register.sh`)
1. Meminta input **email, username, password**.
2. Menyimpan data ke dalam `player.csv` setelah validasi.

### Contoh Eksekusi
```sh
bash register.sh
```

---

## Soal 2B - Login

### Tujuan
- Mengautentikasi "Player" agar dapat mengakses sistem "Arcaea".

### Implementasi (`login.sh`)
1. Meminta input **email dan password**.
2. Cek apakah **email terdaftar**.
3. Verifikasi password dengan **hashing SHA-256**.

### Contoh Eksekusi
```sh
bash login.sh
```

---

## Soal 2C - Validasi Email dan Password

### Tujuan
- Memastikan format email valid.
- Memastikan password aman.

### Implementasi
1. **Validasi email** menggunakan regex (harus ada `@` dan `.`).
2. **Validasi password**:
   - Minimal 8 karakter.
   - Mengandung huruf besar, huruf kecil, dan angka.

---

## Soal 2D - Unik Email

### Tujuan
- Mencegah penggunaan email yang sama untuk lebih dari satu akun.

### Implementasi
1. Mengecek apakah email sudah terdaftar di `player.csv`.
2. Jika sudah terdaftar, tampilkan pesan error dan minta input ulang.

---

## Soal 2E - Hashing Password

### Tujuan
- Mengamankan password agar tidak tersimpan dalam bentuk plaintext.

### Implementasi
1. Menggunakan **SHA-256 dengan static salt**.
2. Simpan hasil hash ke dalam `player.csv`.

---

## Soal 2F - Monitoring CPU

### Tujuan
- Memantau penggunaan CPU secara real-time.

### Implementasi (`core_monitor.sh`)
1. Mengambil **persentase penggunaan CPU**.
2. Mengambil **model CPU**.
3. Menyimpan hasil ke dalam `core.log` dengan format:

```
[YYYY-MM-DD HH:MM:SS] - Core Usage [$CPU%] - Terminal Model [$CPU_Model]
```

### Contoh Eksekusi
```sh
bash scripts/core_monitor.sh
```

---

## Soal 2G - Monitoring RAM

### Tujuan
- Memantau penggunaan RAM secara real-time.

### Implementasi (`frag_monitor.sh`)
1. Mengambil **persentase penggunaan RAM**.
2. Menyimpan informasi **total dan available RAM**.
3. Menyimpan hasil ke dalam `fragment.log` dengan format:

```
[YYYY-MM-DD HH:MM:SS] - Fragment Usage [$RAM%] - Fragment Count [$RAM MB] - Details [Total: $TOTAL MB, Available: $AVAILABLE MB]
```

### Contoh Eksekusi
```sh
bash scripts/frag_monitor.sh
```

---

## Soal 2H - Crontab Manager

### Tujuan
- Mengatur pemantauan CPU dan RAM secara otomatis dengan crontab.

### Implementasi (`manager.sh`)
1. **Menambah atau menghapus monitoring CPU dan RAM** dari crontab.
2. **Menampilkan daftar job aktif** di crontab.

### Contoh Eksekusi
```sh
bash scripts/manager.sh
```

---

## Soal 2I - Log Monitoring

### Tujuan
- Menyimpan log pemantauan CPU dan RAM dalam folder `log/`.

### Implementasi
1. **`core.log`** untuk menyimpan data CPU.
2. **`fragment.log`** untuk menyimpan data RAM.

---

## Soal 2J - Terminal Utama

### Tujuan
- Menggabungkan seluruh sistem dalam satu antarmuka utama.

### Implementasi (`terminal.sh`)
1. Menampilkan menu utama.
2. Memanggil script `register.sh`, `login.sh`, dan `manager.sh`.

### Contoh Eksekusi
```sh
bash terminal.sh
```

---

## Kesimpulan
Sistem ini berhasil mengimplementasikan fitur login, register, validasi keamanan, pemantauan CPU & RAM, serta memiliki Crontab Manager untuk mengotomatisasi proses monitoring. Semua data disimpan dengan aman menggunakan hashing SHA-256.

---




# Soal 4

## Daftar Isi
1. [Pendahuluan](#pendahuluan)
2. [Soal 4A - Backup File Log](#soal-4a---backup-file-log)
3. [Soal 4B - Enkripsi Log](#soal-4b---enkripsi-log)
4. [Soal 4C - Dekripsi Log](#soal-4c---dekripsi-log)
5. [Soal 4D - Automasi Backup](#soal-4d---automasi-backup)
6. [Kesimpulan](#kesimpulan)
7. [Kendala & Perbaikan](#kendala--perbaikan)

---

## Pendahuluan
Johan Liebert adalah orang yang sangat kalkulatif dan ingin mencatat log sistem komputernya dengan ketentuan:
- File backup diberi format `HH:MM dd:mm:yyyy.txt`.
- Isi file harus dienkripsi berdasarkan waktu backup.
- Disediakan script untuk dekripsi.
- Backup otomatis setiap 2 jam menggunakan cron.

---

## Soal 4A - Backup File Log

### Tujuan
- Membuat salinan `syslog` dalam format yang ditentukan.

### Implementasi (`log_backup.sh`)
1. Mengambil waktu saat ini (`HH:MM dd:mm:yyyy`).
2. Menyalin isi `/var/log/syslog` ke dalam file backup.

### Contoh Eksekusi
```sh
bash log_backup.sh
```

---

## Soal 4B - Enkripsi Log

### Tujuan
- Mengenkripsi isi log menggunakan **Caesar Cipher** berdasarkan jam backup.

### Implementasi (`log_encrypt.sh`)
1. Mengambil **jam backup** sebagai shift enkripsi.
2. Menggunakan **tr** untuk menggantikan setiap karakter dalam file.
3. Menyimpan hasil enkripsi dalam file backup.

### Contoh Eksekusi
```sh
bash log_encrypt.sh
```

---

## Soal 4C - Dekripsi Log

### Tujuan
- Mengembalikan isi file log yang telah dienkripsi.

### Implementasi (`log_decrypt.sh`)
1. Menggunakan **tr** untuk menggantikan kembali karakter yang telah diubah.
2. Menyimpan hasil dekripsi dalam file baru.

### Contoh Eksekusi
```sh
bash log_decrypt.sh
```

---

## Soal 4D - Automasi Backup

### Tujuan
- Menjadwalkan backup log setiap 2 jam secara otomatis.

### Implementasi (Crontab)
1. Menambahkan entri crontab:
```sh
0 */2 * * * /bin/bash /path/to/log_backup.sh
```

2. Memastikan script berjalan secara otomatis setiap 2 jam.

---

## Kesimpulan
Sistem berhasil membuat backup, mengenkripsi, dan mendekripsi file log secara otomatis setiap 2 jam.

---

## Kendala & Perbaikan
- **Menyesuaikan format log agar lebih mudah dibaca.**
- **Menguji berbagai skenario enkripsi dan dekripsi untuk memastikan akurasi.**
- **Memastikan cron berjalan dengan benar pada semua sistem.**

