#! /bin/bash
# COLORES
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
  echo -e "\n\n${redColour}[!] SALIENDO...${endColour}"
  sleep 2
  tput cnorm; exit 1 
}
tput civis
trap ctrl_c SIGINT
for i in $(seq 1 254); do 
#  for port in 21 22 23 25 80 443 445 8080; do 
  timeout 1 bash -c "(ping -c 1 192.168.1.$i)" &>/dev/null && echo -e "${turquoiseColour}[+]${endColour} HOST 192.168.1.$i -${greenColour}ACTIVO${endColour}" &
 # done
done
 
wait

tput cnorm
