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

