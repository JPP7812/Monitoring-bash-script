#!/bin/bash

# Farben
GREEN='\033[0;32m'
NC='\033[0m' # keine farb

echo -e "${GREEN}### Hardware Report ###${NC}"
echo "Datum: $(date)"
echo "Hostname: $(hostname)"
echo "---------------------------------"

# CPU 
echo -e "${GREEN}[CPU]${NC}"
lscpu | grep -E "Modell|CPU Operationsmodus|Kern|Core" | head -n 6

# Arbeitsspeicher
echo -e "\n${GREEN}[RAM]${NC}"
grep MemTotal /proc/meminfo

# Festplatten
echo -e "\n${GREEN}[Festplatten]${NC}"
lsblk -d -o NAME,MODEL,SIZE,TYPE,FSTYPE

# Grafikkarte only Nvidia
echo -e "\n${GREEN}[Grafikkarte (GPU)]${NC}"
nvidia-smi | head -n 12

# Netzwerkadapter
echo -e "\n${GREEN}[Netzwerk]${NC}"
lspci | grep -i network

echo "---------------------------------"
