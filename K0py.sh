#!/bin/bash
# Rc7 linux Terminal in Termux
# Created by 12345678MNIN

while true; do
    clear
    echo -e "\e[31m████████╗██╗  ██╗███████╗ ██████╗ ██████╗ ██╗   ██╗██╗     ██╗███╗   ██╗██╗   ██╗\e[0m"
    echo -e "\e[31m╚══██╔══╝██║  ██║██╔════╝██╔═══██╗██╔══██╗██║   ██║██║     ██║████╗  ██║╚██╗ ██╔╝\e[0m"
    echo -e "\e[31m   ██║   ███████║█████╗  ██║   ██║██████╔╝██║   ██║██║     ██║██╔██╗ ██║ ╚████╔╝ \e[0m"
    echo -e "\e[31m   ██║   ██╔══██║██╔══╝  ██║   ██║██╔══██╗██║   ██║██║     ██║██║╚██╗██║  ╚██╔╝  \e[0m"
    echo -e "\e[31m   ██║   ██║  ██║███████╗╚██████╔╝██║  ██║╚██████╔╝███████╗██║██║ ╚████║   ██║   \e[0m"
    echo -e "\e[31m   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝   ╚═╝   \e[0m"
    
    echo -e "\n\e[32mSelect an option:\e[0m"
    echo "1 - Update packages"
    echo "2 - Install Nmap"
    echo "3 - Scan Network (Nmap)"
    echo "4 - Install Metasploit"
    echo "5 - Run Metasploit"
    echo "6 - Install Hydra"
    echo "7 - Test SSH password (Hydra)"
    echo "8 - Install SQLMap"
    echo "9 - Test SQL Injection"
    echo "10 - Install Ngrok"
    echo "11 - Create Ngrok tunnel"
    echo "12 - Install Routersploit"
    echo "13 - Run Routersploit"
    echo "14 - Install John The Ripper"
    echo "15 - Test password with John"
    echo "16 - Install Wireshark"
    echo "17 - Capture packets (tcpdump)"
    echo "18 - Install Nikto (vulnerability scanner)"
    echo "19 - Scan website with Nikto"
    echo "20 - Install Tool-X (hacking toolkit)"
    echo "21 - Run Tool-X"
    echo "22 - Exit"

    read -p "Choose an option: " option

    case $option in
        1) pkg update && pkg upgrade -y ;;
        2) pkg install nmap -y ;;
        3) read -p "Enter IP or domain: " target; nmap -sV $target ;;
        4) pkg install unstable-repo && pkg install metasploit -y ;;
        5) msfconsole ;;
        6) pkg install hydra -y ;;
        7) read -p "Enter IP or domain: " target; read -p "Enter username: " user; hydra -l $user -P /usr/share/wordlists/rockyou.txt ssh://$target ;;
        8) pkg install sqlmap -y ;;
        9) read -p "Enter URL: " url; sqlmap -u $url --dbs ;;
        10) termux-setup-storage && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip && unzip ngrok-stable-linux-arm.zip && chmod +x ngrok ;;
        11) read -p "Enter port: " port; ./ngrok http $port ;;
        12) git clone https://github.com/reverse-shell/routersploit.git && cd routersploit && pip install -r requirements.txt ;;
        13) cd routersploit && python3 rsf.py ;;
        14) pkg install john -y ;;
        15) read -p "Enter password file: " file; john $file ;;
        16) pkg install wireshark -y ;;
        17) tcpdump ;;
        18) git clone https://github.com/sullo/nikto && cd nikto && chmod +x nikto.pl ;;
        19) read -p "Enter URL: " url; perl nikto.pl -h $url ;;
        20) git clone https://github.com/rajkumardusad/Tool-X.git && cd Tool-X && chmod +x install.aex && ./install.aex ;;
        21) Tool-X ;;
        22) exit ;;
        *) echo "Invalid option!" ;;
    esac

    read -p "Press Enter to continue..."
done
