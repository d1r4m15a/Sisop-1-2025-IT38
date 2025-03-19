# Laporan Penjelasan dan Penyelesaian Soal Modul 1
## Soal 1
### Download file csv


wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv && echo "File berhasil didownload" || echo "Gagal" ```bash

## Soal 1A

awk -F',' '$2 ~ /Chris Hemsworth/ {count++} 
END {
	if (count > 0) 
		printf "Chris Hemsworth membaca %d buku\n", count; 
	else 
		print "Tidak ditemukan\n"}' reading_data.csv

Penjelasan:
1. **`awk -F','`**
    - **`F','`** berarti menggunakan tanda **koma (`,`)** sebagai pemisah kolom karena file CSV biasanya dipisahkan dengan koma.
    - Setiap kolom bisa diakses dengan **`$1, $2, $3, ...`**.

