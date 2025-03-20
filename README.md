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
   
### Kode
Pada directori soal kita buat direktori untuk scripts dan membuat scripts
```

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


