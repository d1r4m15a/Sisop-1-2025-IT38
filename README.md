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
### Pembuka Soal
Anda merupakan seorang “Observer”, dari banyak dunia yang dibuat dari ingatan yang berbentuk “fragments” - yang berisi kemungkinan yang dapat terjadi di dunia lain. Namun, akhir-akhir ini terdapat anomali-anomali yang seharusnya tidak terjadi, perpindahan “fragments” di berbagai dunia, yang kemungkinan terjadi dikarenakan seorang “Seeker” yang berubah menjadi “Ascendant”, atau dalam kata lain, “God”. Tidak semua “Observer” menjadi “Player”, tetapi disini anda ditugaskan untuk ikut serta dalam menjaga equilibrium dari dunia-dunia yang terbuat dari “Arcaea”. [Author: Nathan / etern1ty]

### Interpretasi Keseluruhan Soal
Dalam dunia "Arcaea", sistem login/register dibutuhkan untuk membedakan antara "Player" dan "Observer" serta mengamankan akses ke dunia tersebut. Sistem ini mencakup:

- **Pembuatan akun** melalui register dan login.
- **Validasi keamanan** untuk memastikan format email benar dan password kuat.
- **Penyimpanan data akun yang aman** menggunakan hashing SHA-256.
- **Pemantauan CPU dan RAM** untuk menjaga kestabilan dunia "Arcaea".
- **Crontab Manager** untuk mengotomatisasi pemantauan sumber daya sistem.
- **Antarmuka utama** untuk mengakses semua fitur dengan mudah.

---

## Soal 2A - “First Step in a New World”
### Deskripsi Soal
Tugas pertama, dikarenakan kejadian “Axiom of The End” yang semakin mendekat, diperlukan sistem untuk mencatat “Player” aktif agar terpisah dari “Observer”. Buatlah dua shell script, login.sh dan register.sh, yang dimana database “Player” disimpan di /data/player.csv. Untuk register, parameter yang dipakai yaitu email, username, dan password. Untuk login, parameter yang dipakai yaitu email dan password.

### Pembuatan direktori dan script awal
```sh
code login.sh
code register.sh
mkdir data
cd data
touch player.csv
```
`code` digunakan untuk menulis file dengan visual studio code 
`mkdir` untuk membuat direktori data
`cd` untuk masuk ke direktori
`touch` untuk membuat file kosong dengan nama dan format yang telah ditentukan (csv)
### Kode pada register.sh
```
data_folder="./data"
player_db="$data_folder/player.csv"
```
menyimpan alamat player.csv sehingga dapat melakukan read,write pada player.csv

```
mkdir -p "$data_folder"
touch "$player_db"
```
untuk berjaga-jaga bila user belum membuat direktori maka ditambahkan command tersebut

```
read -p "Enter your email: " email
```
untuk menerima email yang di-input user

```
read -p "Enter your username: " username
```
untuk menerima username yang di-input user

```
read -s -p "Enter password: " password
```
untuk menerima password yang di-input user

### Kode pada login.sh
```
read -p "Enter your email: " email
```
untuk menerima input email untuk login

```
read -s -p "Enter password: " password
```

---

## Soal 2B - “Radiant Genesis”
### Deskripsi Soal
Sistem login/register untuk para "Player" tentunya memiliki constraint, yaitu validasi email dan password. 
Email harus memiliki format yang benar dengan tanda @ dan titik, sementara password harus memiliki minimal 8 karakter, setidaknya satu huruf kecil, satu huruf besar, dan satu angka untuk menjaga keamanan data di dunia “Arcaea”.

### Tujuan
- Memastikan format email valid.
- Memastikan password aman.

### Implementasi (`login.sh`)
1. Meminta input **email dan password**.
2. Cek apakah **email terdaftar**.
3. Verifikasi password dengan **hashing SHA-256**.

### Kode pada register.sh
```
if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
```
mengecek validasi email
```
if [[ ${#password} -ge 8 && "$password" =~ [A-Z] && "$password" =~ [a-z] && "$password" =~ [0-9] ]];
```
mengecek validasi password
```
# Input email
while true; do
    read -p "Enter your email: " email
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        if grep -q "^$email," "$player_db"; then
            echo "Email is already registered. Please use another email."
        else
            break
        fi
    else
        echo "Invalid email format. Try again."
    fi
done

# Input username
read -p "Enter your username: " username

# Input password
while true; do
    read -s -p "Enter password: " password
    echo
    if [[ ${#password} -ge 8 && "$password" =~ [A-Z] && "$password" =~ [a-z] && "$password" =~ [0-9] ]]; then
        hashed_password=$(echo -n "$salt$password" | sha256sum | awk '{print $1}')
        echo "$email,$username,$hashed_password" >> "$player_db"
        echo "Registration successful"
        sleep 2
        break
    else
        echo "Password must be at least 8 characters, contain an uppercase letter, a lowercase letter, and a number."
    fi
done
```
Digunakan while loop agar user dapat retry menginput email dan password bila tidak valid, serta diberi petunjuk bagaimana format yang valid

### Kode pada login.sh
```
if ! grep -q "^$email," "$player_db"; then
    echo "Email not found. Please register first."
    exit 1
fi
```
Pada login.sh cukup mengecek apakah email yang user masukkan cocok dengan data yang sudah ada pada `player.csv`
```
echo
hashed_password=$(echo -n "$salt$password" | sha256sum | awk '{print $1}')

# Validate credentials
if grep -q "^$email,.*,$hashed_password" "$player_db"; then
    echo "Login successful. Welcome!"
else
    echo "Incorrect password. Try again."
    exit 1
fi
```
Melakukan hashing(dijelaskan pada soal selanjutnya) dan mencocokan hasilnya dengan data pada `player.csv`

---

## Soal 2C - “Unceasing Spirit”
### Deskripsi Soal
Karena diperlukan pengecekan keaslian “Player” yang aktif, maka diperlukan sistem untuk pencegahan duplikasi “Player”. Jadikan sistem login/register tidak bisa memakai email yang sama (email = unique), tetapi tidak ada pengecekan tambahan untuk username.

### Tujuan
- Mencegah penggunaan email yang sama untuk lebih dari satu akun.

### Kode pada register.sh
```
if grep -q "^$email," "$player_db"; then
            echo "Email is already registered. Please use another email."
        else
            break
        fi
```
`grep` mengambil email yang cocok sesuai yang telah diinputkan bila ada kecocokan maka email tidak dianggap valid


---

## Soal 2D - 
### Deskripsi Soal
Password adalah kunci akses ke dunia Arcaea. Untuk menjaga keamanan "Player", password perlu disimpan dalam bentuk yang tidak mudah diakses. Gunakan algoritma hashing sha256sum yang memakai static salt (bebas).

### Tujuan
- Mengamankan password agar tidak tersimpan dalam bentuk plaintext.
### Implementasi
1. Menggunakan **SHA-256 dengan static salt**.
2. Simpan hasil hash ke dalam `player.csv`.
### Code program
```
salt="arcaea_salt"
```
static salt disini menggunakan teks "arcaea_salt
```
if [[ ${#password} -ge 8 && "$password" =~ [A-Z] && "$password" =~ [a-z] && "$password" =~ [0-9] ]]; then
        hashed_password=$(echo -n "$salt$password" | sha256sum | awk '{print $1}')
        echo "$email,$username,$hashed_password" >> "$player_db"
        echo "Registration successful"
        sleep 2
        break
    else
        echo "Password must be at least 8 characters, contain an uppercase letter, a lowercase letter, and a number."
    fi
```
apa bila password telah memenuhi syarat maka akan dihashing (algoritma SHA-256) dan disave di player.csv

---

## Soal 2E - “The Brutality of Glass”
### Deskripsi Soal
Setelah sukses login, "Player" perlu memiliki akses ke sistem pemantauan sumber daya. Sistem harus dapat melacak penggunaan CPU (dalam persentase) yang menjadi representasi “Core” di dunia “Arcaea”. Pastikan kalian juga bisa melacak “terminal” yang digunakan oleh “Player”, yaitu CPU Model dari device mereka. 
Lokasi shell script: ./scripts/core_monitor.sh


### Tujuan
- Memantau penggunaan CPU secara real-time.

### Implementasi (`core_monitor.sh`)
1. Mengambil **persentase penggunaan CPU**.
2. Mengambil **model CPU**.
   
### Persiapan
```
mkdir scripts
code core_monitor.sh
```
Pada directori soal kita buat direktori untuk scripts dan membuat scripts
### Kode pada scripts
```
PREV_IDLE=$(awk '/^cpu / {print $5}' /proc/stat)
PREV_TOTAL=$(awk '/^cpu / {sum=0; for (i=2; i<=8; i++) sum+=$i; print sum}' /proc/stat)
```
`/proc/stat` menyimpan total waktu yang dihabiskan CPU dalam berbagai status (user, system, idle, dll.).
`$5` adalah jumlah waktu CPU dalam keadaan idle.
Total CPU time dihitung dengan menjumlahkan seluruh kolom dari $2 hingga $8, kecuali kolom pertama (`cpu`).
```
sleep 1
```
Hal ini dilakukan agar kita bisa menghitung perubahan penggunaan CPU dalam rentang waktu 1 detik.
```
IDLE=$(awk '/^cpu / {print $5}' /proc/stat)
TOTAL=$(awk '/^cpu / {sum=0; for (i=2; i<=8; i++) sum+=$i; print sum}' /proc/stat)
```
Sama seperti sebelumnya, kita mengambil nilai idle terbaru (`IDLE`) dan total CPU time terbaru (`TOTAL`).
```
DIFF_IDLE=$((IDLE - PREV_IDLE))
DIFF_TOTAL=$((TOTAL - PREV_TOTAL))
```
`DIFF_IDLE`: Selisih waktu idle dalam 1 detik.
`DIFF_TOTAL`: Selisih total waktu CPU yang digunakan dalam 1 detik.
```
CORE_USAGE=$(awk -v total="$DIFF_TOTAL" -v idle="$DIFF_IDLE" 'BEGIN { usage = (100*(total-idle))/total; printf "%.5f", usage }')
```
Sesuai rumus:
#insert picture later
Menggunakan AWK untuk melakukan perhitungan floating-point (%.5f menampilkan 5 angka desimal).
```
CORE_USAGE=$(echo "$CORE_USAGE" | sed -e 's/0*$//' -e 's/\.$//')
```
Mengoutput performance cpu yang telah dikalkulasi dan menghapus trailing zeros (0.50000 → 0.5).
serta menghapus titik jika angka desimal habis (5. → 5).

```
CORE_MODEL=$(lscpu | awk -F ': ' '/Model name/ {gsub(/^[ \t]+/, "", $2); print $2}')
```
Command diatas untuk mendapat model terminal/model cpu user dan menyimpannya pada variabel `CORE_MODEL`

---

## Soal 2F “In Grief and Great Delight”
### Deskripsi soal
Selain CPU, “fragments” juga perlu dipantau untuk memastikan equilibrium dunia “Arcaea”. RAM menjadi representasi dari “fragments” di dunia “Arcaea”, yang dimana dipantau dalam persentase usage, dan juga penggunaan RAM sekarang. 
Lokasi shell script: ./scripts/frag_monitor.sh
Pastikan perhitungan kalian untuk CPU dan RAM memiliki output yang sama dengan suatu package resource checker, ex: top, htop, btop, bpytop. 


### Tujuan
- Memantau penggunaan RAM secara real-time.

### Implementasi (`frag_monitor.sh`)
1. Mengambil **persentase penggunaan RAM**.
2. Menyimpan informasi **total dan available RAM**.

### Persiapan
Pada directori `/scripts`
```
code frag_monitor.sh
```
kita buat frag_monitor.sh


### Kode pada frag_monitor.sh
```
TOTAL_MEM=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
AVAIL_MEM=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
```
`MemTotal`: Jumlah total RAM dalam satuan kilobyte (kB).
`MemAvailable`: RAM yang masih tersedia dan dapat digunakan oleh sistem tanpa perlu mengambil dari swap.

```
USED_MEM=$((TOTAL_MEM - AVAIL_MEM))
```
Sesuai rumus:
add image

Hasilnya dalam kilobyte (kB).

```
FRAG_USAGE=$(awk -v used="$USED_MEM" -v total="$TOTAL_MEM" 'BEGIN { usage = (100*used)/total; printf "%.2f", usage }')
```
Rumus:
Menggunakan AWK untuk mendapatkan hasil dengan 2 angka desimal (`%.2f`).

---

## Soal 2G - Crontab Manager

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

## Soal 2H - Log Monitoring

### Tujuan
- Menyimpan log pemantauan CPU dan RAM dalam folder `log/`.

### Implementasi
1. **`core.log`** untuk menyimpan data CPU.
2. **`fragment.log`** untuk menyimpan data RAM.

---

## Soal 2I “Irruption of New Color”
### Deskripsi soal
Sistem harus memiliki antarmuka utama yang menggabungkan semua komponen. Ini akan menjadi titik masuk bagi "Player" untuk mengakses seluruh sistem. Buatlah shell script terminal.sh, yang berisi user flow berikut:
Register
Login
	Crontab manager (add/rem core & fragment usage)
	Exit
Exit


### Tujuan
- Menggabungkan seluruh sistem dalam satu antarmuka utama.

### Implementasi (`terminal.sh`)
1. Menampilkan menu utama.
2. Memanggil script `register.sh`, `login.sh`, dan `manager.sh`.

### Kode pada terminal.sh
Ketika script dijalankan, fungsi display_main_menu akan menampilkan menu utama dengan tiga pilihan utama:
```
echo -e "\e[1;36m====================================="
echo "        ARCAEA TERMINAL"
echo -e "=====================================\e[0m"
echo -e "\e[1;33m1   | Register New Account\e[0m"
echo -e "\e[1;32m2   | Login to Existing Account\e[0m"
echo -e "\e[1;31m3   | Exit\e[0m"
echo -e "\e[1;36m====================================="

```
1 | `Register New Account` → Menjalankan `register.sh` untuk membuat akun baru.
2 | `Login to Existing Account` → Menjalankan `login.sh`, jika berhasil login akan masuk ke menu Crontab Manager.
3 | `Exit` → Keluar dari program.
Note:
Warna teks ditambahkan menggunakan ANSI escape codes untuk tampilan yang lebih menarik di terminal.

```
1)
    ./register.sh
    sleep 2
    display_main_menu
    ;;
```
Saat pengguna memilih opsi `1`, script akan menjalankan `register.sh` untuk proses pendaftaran.
Setelah selesai, sistem menunggu 2 detik (`sleep 2`) dan kembali ke menu utama.

```
2)
    if ./login.sh; then
        display_crontab_menu
    else
        echo -e "\e[1;31mLogin failed. Returning to main menu.\e[0m"
        sleep 2
        display_main_menu
    fi
    ;;
```
Jika login berhasil (`./login.sh` mengembalikan exit code `0`), maka pengguna masuk ke `display_crontab_menu.`
Jika login gagal, akan muncul pesan error dan kembali ke menu utama.
```
3)
    echo -e "\e[1;31mExiting... Goodbye!\e[0m"
    exit 0
    ;;
```
Keluar dari program dengan menampilkan pesan `Exiting... Goodbye!.`
`exit 0` memastikan program berhenti dengan sukses.

```
*)
    echo -e "\e[1;31mInvalid option. Try again.\e[0m"
    sleep 2
    display_main_menu
    ;;
```
Jika pengguna memasukkan angka selain `1-3`, maka akan muncul pesan error, menunggu 2 detik, lalu kembali ke menu utama.
#### Setalah login
Jika pengguna berhasil login, mereka akan masuk ke menu Crontab Manager untuk mengelola monitoring CPU & RAM.
```
echo -e "\e[1;36m====================================="
echo "        ARCAEA TERMINAL"
echo -e "=====================================\e[0m"
echo -e "\e[1;32m1   | Add Core Monitor to Crontab\e[0m"
echo -e "\e[1;32m2   | Add Fragment Monitor to Crontab\e[0m"
echo -e "\e[1;31m3   | Remove Core Monitor from Crontab\e[0m"
echo -e "\e[1;31m4   | Remove Fragment Monitor from Crontab\e[0m"
echo -e "\e[1;34m5   | View Scheduled Monitoring Jobs\e[0m"
echo -e "\e[1;31m6   | Exit\e[0m"
echo -e "\e[1;36m====================================="
```
Pilihan Menu Crontab Manager
Add Core Monitor (Option 1) → Menambahkan monitoring CPU ke crontab.
Add Fragment Monitor (Option 2) → Menambahkan monitoring RAM ke crontab.
Remove Core Monitor (Option 3) → Menghapus monitoring CPU dari crontab.
Remove Fragment Monitor (Option 4) → Menghapus monitoring RAM dari crontab.
View Scheduled Jobs (Option 5) → Melihat daftar monitoring aktif di crontab.
Exit (Option 6) → Keluar dari program.

```
1) ./scripts/manager.sh add_core; display_crontab_menu ;;
2) ./scripts/manager.sh add_frag; display_crontab_menu ;;
3) ./scripts/manager.sh remove_core; display_crontab_menu ;;
4) ./scripts/manager.sh remove_frag; display_crontab_menu ;;
5) ./scripts/manager.sh view_jobs; read -p "Press Enter to continue..."; display_crontab_menu ;;
6) echo -e "\e[1;31mExiting... Goodbye!\e[0m"; exit 0 ;;
```
Untuk menghubungkan dengan `manager.sh`
Setiap pilihan akan memanggil `manager.sh` dengan argumen sesuai kebutuhan (`add_core`, `remove_core`, dll.).
Setelah eksekusi selesai, menu akan ditampilkan kembali (`display_crontab_menu`).
Untuk melihat daftar cron jobs (Option 5), pengguna harus menekan Enter sebelum kembali ke menu.

---

## Kesimpulan
Sistem ini berhasil mengimplementasikan fitur login, register, validasi keamanan, pemantauan CPU & RAM, serta memiliki Crontab Manager untuk mengotomatisasi proses monitoring. Semua data disimpan dengan aman menggunakan hashing SHA-256.

---




# Laporan Resmi Modul 1 - Soal 4

## Daftar Isi
1. [Pendahuluan](#pendahuluan)
2. [Soal 4A - Summary Data](#soal-4a---summary-data)
3. [Soal 4B - Sorting Data](#soal-4b---sorting-data)
4. [Soal 4C - Pencarian Nama Pokemon](#soal-4c---pencarian-nama-pokemon)
5. [Soal 4D - Filter Berdasarkan Type](#soal-4d---filter-berdasarkan-type)
6. [Soal 4E - Error Handling](#soal-4e---error-handling)
7. [Soal 4F - Help Screen](#soal-4f---help-screen)
8. [Kesimpulan](#kesimpulan)
9. [Kendala & Perbaikan](#kendala--perbaikan)

---

## Pendahuluan
Dalam tugas ini, kita melakukan analisis terhadap dataset **pokemon_usage.csv** untuk memahami tren Pokemon yang digunakan dalam turnamen "Generation 9 OverUsed 6v6 Singles". Sistem ini mencakup:

- **Menampilkan summary data** tentang penggunaan Pokemon.
- **Mengurutkan data berdasarkan kolom tertentu**.
- **Mencari Pokemon berdasarkan nama.**
- **Menyaring Pokemon berdasarkan tipe**.
- **Menangani kesalahan input** agar program tidak crash.
- **Menyediakan help screen dengan penjelasan lengkap.**

---

## Soal 4A - Summary Data

### Tujuan
- Menampilkan Pokemon dengan **Usage% dan Raw Usage tertinggi**.

### Implementasi (`pokemon_analysis.sh --info`)
1. Membaca dataset `pokemon_usage.csv`.
2. Menemukan Pokemon dengan **Usage% tertinggi**.
3. Menemukan Pokemon dengan **Raw Usage tertinggi**.
4. Menampilkan hasil dalam format yang jelas.

### Contoh Eksekusi
```sh
bash pokemon_analysis.sh pokemon_usage.csv --info
```

### Contoh Output
```
Summary of pokemon_usage.csv
Highest Adjusted Usage: Garchomp with 31.09%
Highest Raw Usage: Landorus-Therian with 563831 uses
```

---

## Soal 4B - Sorting Data

### Tujuan
- Mengurutkan Pokemon berdasarkan kolom tertentu (Usage%, Raw Usage, HP, Atk, dll.).

### Implementasi (`pokemon_analysis.sh --sort <kolom>`)
1. Membaca dataset `pokemon_usage.csv`.
2. Mengurutkan berdasarkan kolom yang diminta.
3. Menampilkan hasil dalam format CSV.

### Contoh Eksekusi
```sh
bash pokemon_analysis.sh pokemon_usage.csv --sort usage
```

### Contoh Output
```
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
Garchomp,31.09%,253499,Ground,Dragon,108,130,95,80,85,102
Landorus-Therian,27.06%,563831,Ground,Flying,89,145,90,105,80,91
...
```

---

## Soal 4C - Pencarian Nama Pokemon

### Tujuan
- Menampilkan statistik dari Pokemon berdasarkan nama yang dimasukkan.

### Implementasi (`pokemon_analysis.sh --grep <nama>`)
1. Membaca dataset `pokemon_usage.csv`.
2. Mencari Pokemon yang sesuai dengan nama yang dimasukkan.
3. Menampilkan hasil dalam format CSV.

### Contoh Eksekusi
```sh
bash pokemon_analysis.sh pokemon_usage.csv --grep rotom
```

### Contoh Output
```
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
Rotom-Wash,1.62%,71243,Electric,Water,50,65,107,105,107,86
```

---

## Soal 4D - Filter Berdasarkan Type

### Tujuan
- Menampilkan Pokemon yang memiliki tipe tertentu.

### Implementasi (`pokemon_analysis.sh --filter <type>`)
1. Membaca dataset `pokemon_usage.csv`.
2. Memfilter berdasarkan tipe yang diminta.
3. Menampilkan hasil dalam format CSV.

### Contoh Eksekusi
```sh
bash pokemon_analysis.sh pokemon_usage.csv --filter dark
```

### Contoh Output
```
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
Ting-Lu,21.52%,192107,Dark,Ground,155,110,125,55,80,45
Kingambit,21.27%,412146,Dark,Steel,100,135,120,60,85,50
```

---

## Soal 4E - Error Handling

### Tujuan
- Menangani input yang tidak valid dengan pesan error yang jelas.

### Implementasi
1. Memeriksa apakah semua argumen yang dibutuhkan sudah diberikan.
2. Jika tidak valid, tampilkan pesan error yang informatif.

### Contoh Eksekusi
```sh
bash pokemon_analysis.sh pokemon_usage.csv --filter
```

### Contoh Output
```
Error: no filter option provided
Use -h or --help for more information
```

---

## Soal 4F - Help Screen

### Tujuan
- Memberikan petunjuk lengkap kepada pengguna.

### Implementasi (`pokemon_analysis.sh -h` atau `--help`)
1. Menampilkan ASCII art yang menarik.
2. Menjelaskan setiap command dan sub-command.

### Contoh Eksekusi
```sh
bash pokemon_analysis.sh -h
```

### Contoh Output
```
subject to change
Usage:
  pokemon_analysis.sh <file> [command]

Commands:
  --info          Menampilkan summary data
  --sort <col>    Mengurutkan data berdasarkan kolom tertentu
  --grep <name>   Mencari Pokemon berdasarkan nama
  --filter <type> Menyaring Pokemon berdasarkan type
  -h, --help      Menampilkan petunjuk penggunaan
```

---

## Kesimpulan
Sistem ini berhasil menganalisis data Pokemon dengan fitur summary, sorting, pencarian nama, filter tipe, error handling, dan help screen.

---

## Kendala & Perbaikan
- **Menyesuaikan format output agar lebih user-friendly.**
- **Mengoptimalkan pencarian agar lebih cepat pada dataset besar.**


