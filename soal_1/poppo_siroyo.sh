wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv && echo “File berhasil didownload” || echo “Gagal”
awk -F',' '$2 ~ /Chris Hemsworth/ {count++} END {if (count > 0) printf "Chris Hemsworth membaca %d buku\n", count; else print "Tidak ditemukan\n"}' reading_data.csv
awk -F"," '$8 == "Tablet" {total += $6; count++} END {if (count > 0) printf "Rata-rata durasi membaca dengan Tablet adalah %.2f menit\n", total/count; else printf "Tidak ada data tablet\n"}' reading_data.csv
awk -F"," 'NR > 1 {if ($7 > max) {max = $7; nama = $2; judul=$3}} END {if (max != "" ) print "Pembaca dengan rating tertinggi:", nama, "-", judul, "-", max; else print "Data tidak ditemukkan"}' reading_data.csv
awk -F"," 'BEGIN { OFS="," } NR > 1 { split($5, date, "-"); if ($9 == "Asia" && date[1] > 2023) count[$4]++ } END { max = 0; for (genre in count) { if (count[genre] > max) { max = count[genre]; popular = genre } } if (max > 0) printf "Genre paling populer di Asia setelah 2023 adalah %s dengan %d buku.\n", popular, max; else print "Tidak ada data sesuai kriteria" }' reading_data.csv

