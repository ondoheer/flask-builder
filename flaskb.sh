#!/bin/bash

#Defining variables and functions
packagesToInstall[0]="flask" # Set the basic array with packages to install with pip



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


# 2. Choose virtualenv wrapper, virtual env or none
function virtualenvMenu(){
	echo "Choose the virtualization method you want to use"
	OPTIONS="virtualenvwrapper virtualenv None"
	select opt in $OPTIONS; do
		if [[ "$opt" = "virtualenvwrapper" ]]; then
			mkvirtualenv $projectName
			break
		elif [[ "$opt" = "virtualenv" ]]; then
			virtualenv venv
			break
		elif [[ "$opt" = "None" ]]; then			
			echo "You chose None, be sure you run this script as root or that your iser has write permissions to install python packages."
			break
		else
			echo "You chose an invalid option"
			virtualenvMenu
		fi
	done
}
virtualenvMenu

# 3. Choose Flask-script or not

echo "Do you want to use Flask-script? I recommend it!(Yy/Nn)"
read useFlaskScript

if [[ $useFlaskScript == "y" || useFlaskScript == "Y" ]]; then
	packagesToInstall+=" flask-script"
fi

# 4. Choose the ORM
function ormMenu(){
	echo "Choose an ORM library"
	OPTIONS="flask-sqlalchemy pony flask-mongoengine"
	select opt in $OPTIONS; do
		packagesToInstall+=" "
		packagesToInstall+=$opt
		break
	
			
	done
}
echo "Do you want to initialize an ORM?(Yy/Nn)"
read useORM
if [[ $useORM == "y" || $useORM == "Y" ]]; then
	ormMenu
	echo "using ormmenu"
fi

echo $packagesToInstall


# FIN TEMPORAL DE LIMPIEZA
cd ..
rm -rf $projectName

#. ask for flask-script
#. ask for ORM to use(Yy/Nn)
#. ask for packages to use
#. ask for heroku
#. sass or css