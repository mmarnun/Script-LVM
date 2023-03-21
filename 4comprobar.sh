#Funcion para comprobar si el disco tiene particiones.
#Tiene = 1
#No Tiene = 0
function f_comprobar_part {
j=1
  for i in $(lsblk -n -d -o NAME); do
    if [ "$(lsblk -o NAME,TYPE | awk '$2=="part"{print $1}' | egrep -o "$i")" = "" ]; then
      return 0
      eval disco$j=$i
      j=$((j+1))
    else
      return 1
    fi
  done
}
