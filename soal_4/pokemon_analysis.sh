#!/bin/bash

if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$#" -lt 2 ]; then
    echo "                                              @@@@@@@@@@@@@@@                                       
               +++@@@@@@@               @@@@@@=........:----+@@@@                                   
                   ++#@@@@%*+        ++%%+-...:=#@@@@@@@@@%*+=--#@@                                 
                     @@@@@@@#++    ++#@@%+=@@@@@@         @@@@#+==#@                                
                     @@@@@@@@@@  ++*@@@@@@@@@                 @@+=#@            @@@@@@@@@@@@        
                     @@@@@@@@@#+*@@@@@@@@@@@@                 @@*+==@@     @%%%%=.........:*%%%@    
                     ++%@@@@@@@@@@@@@@@@@@%++                   @%+=@@     @#:..:-%@@@@@@+----+@@   
                      @@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@      @%+=@@  @@@.:-+@@@@      @@@%-+@@   
                       ++@@@%*#%%%%%@@@@%*+%*-===========%%%@@  @%+=@@ @%=.=+%@           @@%==+#@@ 
                         +*@@@#+===+@@@@%+====*@@@@@@@@#++++*@@@@%*+@@@%%+-@@@              @@#=#@@@
                              @@@@@@@@@@@@@@@@@        @@@@@@@@@@%*+@@@*-++@@@            @@@@#+#@@@
                       @@@@%%%*++++++#@*++++*%%%%%@@@@%+-........:*%@@@#+%@              @@@@@@@@@@@
                     @@%%%#+++++==+++#%*++++++++++%%%#=-:...:-----::%%%#*%@              @@@@@@@@@@@
                     @@*++++=-=+=--=+++++==++=-=+++++#@@@..------------*@@@              @@@@@@@@@@@
                  @@%*++++=-----..-=+++++++=-:....+++++++%#+=-------.:--=#%@@          **%@@@@@@@@*+
                @@%#+++-----:.....---=++++++++++==::-=++++*%#-----:....----%%%@        @@@@@@@@%%@@ 
               @@%+++=-:..........--==+++++++++++++=::-=++*%#==---:..:------+%%@      +%@@@@%@#++   
              @@%%+=-:......:===::-=++++++++#@%%%%**++==++++*@#---::----------+%%@   ++#@@%*+       
              @%*+-:...-==-:-+++==++++++++++*%+-:.##**+++++-=@#-----------------*@@                 
              @%*+..:::=+++=+*********++++++++#%-.-+%#++++=:-@#-::-------==-----*@@                 
            @@%%*+.:-==++****#######%#*****++*##-.-+%#-=+--.-%*==--------++-----*@@                 
            @@*++++++****##*=...::::=+#####***-...+*#*---...:-*@+------==++---==#@@                 
            @@*+*******#%::....:---+@*--=***=....:@%+=-:.::.:-*@+---==-=+++-===+#@@                 
            @@**%%....:=+....:-----+@+.:-#%....:=+%#+=-::=-.:=*@+--=++=++++-=+**#@@                 
 @@@        @@##*+...:=*#..:-------+@+..:#%...=*##+++=-==+=:-#%@+--=+++++=--=+#@@                   
@#+*@@      @@@%-...:-=+*.:--------=#*=::+*===*#*+++++=++++=+@@@+-==+++++===+##@@                   
@#:=@@    @@#*%%-.::---+*::--------=+#@=:-=%%@#++++++++++++*#@%#+=++++++++++*@@                     
@#:-+#@@@@@@+.*%-.---+**+*+=-------==*#****###*++++++++*#+*#%@#=++++=+++++++*#%@@                   
@#:..-==++#@+.*%=:---+*++*+=----:-**-==*###@#++++++++++*####%@#+++==-====+++++#@@                   
@#+-...::-+@+.=***----=+*::-----.-%%*+-++++@#++++++++++*###@@@#++==------+++++#@@                   
 @@*+++---=**+==#%-------++*+---.-%%++*++++@#++++++++*#%@##@%###=--------==+++#@@                   
   @@@@#####%@*+%%::--=*#---+#+-.-%%*#@*+#%@#++++++*##*%@@%##%%@*==--------+*#%@@                   
       @@@@@@@%%@%*=:-=#@..:+@*-.-%@@%***%@@#+++#%++*#%%@#*+*@@@*+=--------+*@@                     
            @@#####**-:=***#*+=-.-%#=++#%%@#*+++*#+*###%@+++*@@@%#+=-------+*@@                     
            @@+=++++**#=-+++=-----=+#*+%@@%+++++#%%%@@%#*+*%%@@@@@%#-----=+%%@@                     
            @@+-==+++#%+-----------=**+%@@%+++#%@@@@@%**++*%@@@@@@@%-----++@@@                      
            @@=:--=+#%@##--------==++++%@#*+*###%@@%#*+++#%@@@@@@@@%---=+#%@@                       
            @@-..:-+@@ @@%#=----+++++++%%*++#@%%@@**+++#%@@@@@@  @@%---=+%@                         
            @@-...-+@@   @%++++++++*%#+%%*+%@@@@#++++*%%@@@      @@%---=+%@                         
            @@#*=--=*#@@ @%%#++++++*@#+%%*+@@@@@*++++#@@         @@%:-+++%@                         
              @%+=++++*%@  @%%*+++++*#%#*%%@@@#*+++*%%@@        @%=:-=+#%%@                         
               @@%+++++++@@@@@@@@@@@@@@@@@@@#++++++*@@          @%+--=+#@@                          
               @@%+++++++*#@@@@@@@@@@@@@@@@@#=++++%%@@        @@=:::-=+#@@                          
                @@%#+++++%%@@@@@@%*+@@@@@@%==-==++@@@         @@-.:--=+#@@                          
                   @@@@@@@@@@@@@@@@@ @@@@@%-----++@@@       @@#----=+++#@@                          
                   ++#@@@@@@@@@@@@@@  @ @@%----=#@@@      @@@@#++++++*%@@@                          
                    +**%@@%=*@@@@%**   @%-:.:--=#@        @@@@@%%%%%%@@@@@                          
                      +++@@@@@@@+++    @%-..:-=+%@       @@@@@@@@@@@@@@@@@                          
                                     @@-....:-=+%@       @%=+@@@@@@@@@@@@@                          
                                   ++#@+----=+#@@@       @@%%@@@@@@@@@@#++                          
                                   @@@@@@@@@@@@@@@       @@@@@@@@@@@@#++                            
                                 ++*@@@@@@@@@@@@@@                                                  
                                 @@#=*@@@@@@@@@@@@                                                  
                                 @@@@@@@@@@@@@@@*+                                                  
                                 @@@@@@@@@@@@@#++                                                                                                 
"
    echo -e "Hello there, I'm Tauros and I'm gonna help you use this script by knowing its commmands
\U1F449 First of all, to summon me to help you, just use ./pokemon_analysis.sh -h  
or ./pokemon_analysis.sh --help
\U1F449 Next, the template/base command to use the script is this
Usage: ./pokemon_analysis.sh <file_name> [options]
\U1F449Replace the <file_name> with pokemon_usage.csv or file with similar name 
as long as its in the same directory as the script and contain data with
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed as the header
\U1F449 For the [option] you can choose one of the features bellow \U1F447
  -i, --info          Display the highest adjusted and raw usage.
  -s, --sort <method> Sort the data by the specified column.
                      name      Sort by Pokemon name.
                      usage     Sort by Adjusted Usage.
                      raw       Sort by Raw Usage.
                      hp        Sort by HP.
                      atk       Sort by Attack.
                      def       Sort by Defense.
                      spatk     Sort by Special Attack.
                      spdef     Sort by Special Defense.
                      speed     Sort by Speed.
  -g, --grep <name>   Search for a specific Pokemon sorted by usage.
  -f, --filter <type> Filter by type of Pokemon sorted by usage.
Huh? how can I do this \U1F447, a Tauros can't do this normally
I guess I'm special then
Anyway if you need me just type ./pokemon_analysis.sh -h or ./pokemon_analysis.sh --help
See ya next time :D \U1F44B
  "

    exit 0
fi

csv_file="$1"
command="$2"
option="$3"

if [ ! -f "$csv_file" ]; then
    echo "Error: File $csv_file not found!"
    exit 1
fi

if [ "${csv_file##*.}" != "csv" ]; then
    echo "Error: File $csv_file is not a CSV file!"
    exit 1
fi

expected_header="Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed"
actual_header=$(head -n 1 "$csv_file")

if [ "$actual_header" != "$expected_header" ]; then
    echo "Error: CSV format is not the expected pokemon data. Expected contains: $expected_header"
    exit 1
fi


case "$command" in
    --info)
        awk -F ',' '
        NR > 1 {
            usage = $2 + 0
            rawUsage = $3 + 0
            if (usage > maxUsage) {
                maxUsage = usage
                highestPokemonUsage = $1
            }
            if (rawUsage > maxRawUsage) {
                maxRawUsage = rawUsage
                highestPokemonRawUsage = $1
            }
        }
        END {
            print "Summary of " FILENAME
            print "Highest Adjusted Usage: " highestPokemonUsage " with " maxUsage "%"
            print "Highest Raw Usage: " highestPokemonRawUsage " with " maxRawUsage " uses"
        }' "$csv_file"
        ;;

    --sort)
        declare -A column_map
        column_map=(
            ["name"]=1 ["usage"]=2 ["raw"]=3 ["tipe1Alphabet"]=4 ["tipe2Alphabet"]=5
            ["hp"]=6 ["atk"]=7 ["def"]=8 ["spatk"]=9 ["spdef"]=10 ["speed"]=11
        )

        if [[ -z ${column_map[$option]} ]]; then
            echo "Error: Invalid column name '$option'. Please specify a valid column."
            echo "Use --help for usage info."
            exit 1
        fi
        col_index=${column_map[$option]}
        echo "$(head -n 1 "$csv_file")"
        if [[ "$col_index" -eq 1 ]]; then
            tail -n +2 "$csv_file" | sort -t ',' -k"$col_index","$col_index" -n
        else
            tail -n +2 "$csv_file" | sort -t ',' -k"$col_index","$col_index" -nr
        fi
        ;;
    --grep)
        if [ -z "$option" ]; then
            echo "Error: Please specify a Pokémon name to search"
            exit 1
        fi
        echo "$(head -n 1 "$csv_file")"
        grep -i "$option" "$csv_file" || echo "Pokémon '$option' not found."
        ;;

    --filter)
        if [ -z "$option" ]; then
            echo "Error: Please specify a type to filter"
            exit 1
        fi
        echo "$(head -n 1 "$csv_file")"
        awk -F ',' -v type="$option" 'NR > 1 && (tolower($4) == tolower(type) || tolower($5) == tolower(type))' "$csv_file" | sort -t ',' -k2 -nr
        ;;

    *)
        echo "Error: Unknown command '$command'. Use -h or --help for usage info."
        echo "Syntax=./pokemon_analysis.sh -h or ./pokemon_analysis.sh --help"
        exit 1
        ;;
esac
