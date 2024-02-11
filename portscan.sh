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


# Cancelar Control C
function ctrl_c (){
  echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
  sleep 2
  exit 1
}
function checkPort(){
  (exec 3<> /dev/tcp/$1/$2) 2>/dev/null
  
  if [ $? -eq 0 ]; then
    echo -e "${greenColour}[+]${endColour} HOST $1 - Port $2 ${turquoiseColour}(PUERTO ABIRTO) ${endColour}"
  fi
  if [ $2 -eq 65535 ]; then
    echo -e "${purpleColour}[!] ULTIMO PUERTO${endColour}"
  fi
  exec 3<&-
  exec 3>&-
}


trap ctrl_c SIGINT
# Declara el array
declare -a ports=( $(seq 1 65535) )

if [ $1 ]; then
# bucle para el escaneo de los puertos
  for port in ${ports[@]}; do 
    checkPort $1 $port & 
  done
else
  echo -e "\n${redColour}[!]${endColour} Uso: $0 <ip-address>\n"
fi

wait 

########
