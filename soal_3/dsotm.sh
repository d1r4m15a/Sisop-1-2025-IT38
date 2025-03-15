#!/bin/bash

# Mengambil nilai song dari argumen pertama
song=$(echo $1|awk -F= '{print $2}')

# Jika song adalah Speak to Me, loop jalan untuk kata afirmasi acak
if [[ $song == "Speak to Me" ]]
then
	while [ true ]
	do
		# Mengambil teks afirmasi acak dari API
		af=$(curl -H "Accept: application/text" "https://www.affirmations.dev" 2>/dev/null)
		# Memastikan muncul hanya teks afirmasi
		echo $af|awk -F: '{print $2}'|awk -F} '{print $1}'
		sleep 1
	done
	
# Jika song adalah On the Run, tampilkan progress bar
elif [[ $song == "On the Run" ]]
then
	for ((num=1; num<=100; num=num+1))
	do
		for ((p=1;p<=100;p=p+1))
		do
			if [[ $p -le $num ]]
			then
				echo -n "#"
			else
				echo -n " "
			fi
		done
		echo -n " "
		echo -n $num
		echo -n "%"
		# sleep dan $RANDOM untuk delay acak
		sleep $(awk -v seed=$RANDOM 'BEGIN { srand(seed); print 0.1 + rand() * 0.9 }')
		echo -ne "\r"
	done

# Jika song adalah Time, jam muncul
elif [[ $song == "Time" ]]
then
	while [ true ]
	do
		echo -n $(date +"%Y-%m-%d %H:%M:%S")
		# update per detik
		sleep 1
		echo -ne "\r"
	done

# Jika song adalah Money, animasi simbol mata uang muncul
elif [[ $song == "Money" ]]
then
	# mendapatkan jumlah baris dan kolom layar terminal
	rows=$(tput lines)
	cols=$(tput cols)
	# Array character mata uang
	chars=("$" "€" "£" "¥" "¢" "₹" "₩" "₿" "₣")
	clear

	while [ true ]
	do
    		# loop menampilkan 10 character acak di posisi acak
    		for ((i=0; i<10; i++))
    			do
        			# menghasilkan posisi acak (x,y) di dalam terminal
        			x=$((RANDOM % cols + 1))
        			y=$((RANDOM % rows + 1))
       				# memilih character mata uang acak dari array
       				char=${chars[$RANDOM % ${#chars[@]}]}
        			# menampilkan character tanpa newline
        			echo -ne "\e[${y};${x}H${char}"
    			done
    		sleep 0.2
    		echo -e "\e[1S"
	done

# Jika song adalah Brain Damage, maka top
elif [[ $song == "Brain Damage" ]]
then
	top
# error
else
	echo "gagalwoi"
fi


