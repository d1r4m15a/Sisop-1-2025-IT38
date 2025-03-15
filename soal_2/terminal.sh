#!/bin/bash

display_main_menu() {
    clear
    echo -e "\e[1;36m====================================="
    echo "        ARCAEA TERMINAL"
    echo -e "=====================================\e[0m"
    echo -e "\e[1;33m1   | Register New Account\e[0m"
    echo -e "\e[1;32m2   | Login to Existing Account\e[0m"
    echo -e "\e[1;31m3   | Exit\e[0m"
    echo -e "\e[1;36m====================================="
    read -p "Enter option [1-3]: " choice

    case $choice in
        1)
            ./register.sh
            sleep 2
            display_main_menu
            ;;
        2)
            if ./login.sh; then
                display_crontab_menu
            else
                echo -e "\e[1;31mLogin failed. Returning to main menu.\e[0m"
                sleep 2
                display_main_menu
            fi
            ;;
        3)
            echo -e "\e[1;31mExiting... Goodbye!\e[0m"
            exit 0
            ;;
        *)
            echo -e "\e[1;31mInvalid option. Try again.\e[0m"
            sleep 2
            display_main_menu
            ;;
    esac
}

display_crontab_menu() {
    clear
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
    read -p "Enter option [1-6]: " choice

    case $choice in
        1) ./scripts/manager.sh add-cpu; read -p "Press Enter to continue..."; display_crontab_menu ;;
        2) ./scripts/manager.sh add-ram; read -p "Press Enter to continue..."; display_crontab_menu ;;
        3) ./scripts/manager.sh remove-cpu; read -p "Press Enter to continue..."; display_crontab_menu ;;
        4) ./scripts/manager.sh remove-ram; read -p "Press Enter to continue..."; display_crontab_menu ;;
        5) ./scripts/manager.sh view-scheduled; read -p "Press Enter to continue..."; display_crontab_menu ;;
        6) echo -e "\e[1;31mExiting... Goodbye!\e[0m"; exit 0 ;;
        *) echo -e "\e[1;31mInvalid option. Try again.\e[0m"; sleep 2; display_crontab_menu ;;
    esac
}

display_main_menu
