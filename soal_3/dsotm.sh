#!/bin/bash
song=$(echo "$1"|awk -F= '{print $2}')
if [[ $song == "Speak to Me" ]]
then
	while [ true ]
        do
                read -n1 -s -t 0.1 key
                if [[ $key == "q" ]]; then
                        echo ""
                        break
                fi
                af=$(curl -H "Accept: application/text" "https://www.affirmations.dev" 2>/dev/null)
                echo $af|awk -F: '{print $2}'|awk -F} '{print $1}'
                sleep 1
        done
        clear
elif [[ $song == "On the Run" ]]
then
	cols=$(($(tput cols) - 7))
        for ((num=1; num<=100; num=num+1))
        do
                echo -n "["
                for ((p=1;p<=$cols;p=p+1))
                do
                        if [[ $p -le $(($num*$cols/100)) ]]
                        then
                                echo -n "░"
                        else
                                echo -n " "
                        fi
                done
                echo -n "] "
                echo -n $num
                echo -n "%"
                sleep $(awk -v seed=$RANDOM 'BEGIN { srand(seed); print 0.1 + rand() * 0.9 }')
                echo -ne "\r"
                read -n1 -s -t 0.1 key
                if [[ $key == "q" ]]; then
                        clear
                        break
                fi
        done
        echo ""
	clear
elif [[ $song == "Time" ]]
then
	while [ true ]
	do
		read -n1 -s -t 0.1 key
                if [[ $key == "q" ]]; then
                        clear
                        break
                fi
		echo -n $(date +"%Y-%m-%d %H:%M:%S")
		sleep 1
		echo -ne "\r"
	done
	clear
elif [[ $song == "Money" ]]
then
	rows=$(tput lines)
        cols=$(tput cols)
        chars=("$" "€" "£" "¥" "¢" "₹" "₩" "₿" "₣")
        clear

        while [ true ]
        do
                read -n1 -s -t 0.1 key
                if [[ $key == "q" ]]; then
                        clear
                        break
                fi
                for ((i=0; i<10; i++))
                        do
                                x=$((RANDOM % cols + 1))
                                y=$((RANDOM % rows + 1))
                                char=${chars[$RANDOM % ${#chars[@]}]}
                                echo -ne "\e[${y};${x}H${char}"
                        done
                sleep 0.2
                echo -e "\e[1S"
        done
elif [[ $song == "Brain Damage" ]]
then
	top
	clear
else
	echo "gagalwoi"
fi



