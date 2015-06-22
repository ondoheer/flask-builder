if [[ "ya Yo no N1 " != *"na"* ]]; then
	echo "no esta"
fi

function boolMenu(){
	echo $1 "(Yy/Nn)"
	read value
	if [[ "yYnN" != *$value* ]]; then
		boolMenu $1
	elif [[ "yY" == *$value* ]]; then
		echo "y"
	else
		echo "n"
	fi
}

function menu(){
	OPTIONS=$1
	           select opt in $OPTIONS; do
	               if [ "$opt" = "hablar" ]; then
	                menuresult=$opt
	         		return 0
	             
	               elif [ "$opt" = "comer" ]; then
	                $2 =  $opt
	                exit
	               else
	                menu
	               fi
	           done

}


menu "hablar comer" menuresult

# boolMenu "Quieres elegir esto?"
# read result
echo -n "Mis resultados" $menuresult #$result
