#!/bin/bash

newfile=$( ls -t | head -n 1 | grep .sh ) #this will fetch the latest .sh file

echo "This file is latest $newfile"
gitignorefile="`pwd`/.gitignore"
if [[ ! -e $gitignorefile  ]]; then
	echo "****Creating gitignore file*******"
	touch .gitignore
	echo "gitpush.sh" > .gitignore
else
	echo "*******checking gitignore file*******"
	echo "**********File already exists********"
	echo "gitpush.sh" > .gitignore
fi

read -p "Do you want to commit this file:" answer
if [[ $answer = [Yy] ]]; then
	echo "************************************"
	echo "******Git Process is Started********"
	echo "*************************************"
	echo "*************************************"
    git add $newfile
    echo "******This file is added $newfile ***"
    echo "*************************************"
    git status
    read -p "Enter your commit message:" commitmsg
    git commit -m "$commitmsg"
    git push origin master
elif [[ $answer = [Nn] ]]; then
	echo "******Git Process is stopped******"
	echo "*********Nothing to checkin*******"

fi


