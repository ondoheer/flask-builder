#!/bin/bash

#Defining variables and functions
packagesToInstall[0]="flask" # Set the basic array with packages to install with pip

function menu(){
    # get options
    OPTIONS=$1
    # show options to the user
   	select opt in $OPTIONS; do
   		# check if the options are valid
   		if [[ *"$opt"* != $OPTIONS ]]; then
   			echo "You selected an invalid choice"
   			menu $1

   		else
   			#asign value to global variable
   			menuresult=$opt
   		fi
   	done
}

function boolMenu(){
	echo $1 "(Yy/Nn)"
	read value
	if [[ "yYnN" != *$value* ]]; then
		boolMenu $1
	elif [[ "yY" == *$value* ]]; then
		return 0
	else
		return 1
	fi
}

#. ask for name of the project
echo "#####################"
echo "##  Flask-Builder  ##"
echo "#####################"
echo " "
echo "Starting to build your project, what will you name it?"

# 1. Get project Name
read projectName
# Build project folder
mkdir $projectName
cd $projectName


# 2. Choose virtualenv wrapper or virtual env

echo "Quieres Venv?"
if $(boolMenu); then
	mkvirtualenvwrapper $projectName
else
	virtualenv venv
fi

# 3. Choose Flask-script or not

echo "Do you want to use Flask-script? I recommedn it!(Yy/Nn)"
read useFlaskScript

if [[ $useFlaskScript == "y" || useFlaskScript == "Y" ]]; then
	packagesToInstall=("${packagesToInstall[@]}" "flask-script")
fi

# 4. Choose the ORM

echo "Do you want to initialize an ORM?(Yy/Nn)"
read userORM
if [[ $useORM == "y" || $useORM == "Y" ]]; then
	echo "Choose one of the following"
	echo "1. Flask-SQLAlchemy"
	echo "2. PonyORM"
	echo "3. Mongoengine"
	echo "choose one: (1, 2, 3)"
fi


#. ask for flask-script
#. ask for ORM to use(Yy/Nn)
#. ask for packages to use
#. ask for heroku
#. sass or css

