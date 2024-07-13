#!/bin/bash
## Basic for loop
#
echo "This script will create a user account for all the users you specify."
echo ""
read -p "For all the user's you'd like to add, type their username separated by a space:

Username(s):  " USERS

for NAME in $USERS
do
useradd $NAME
done

for NAME in $USERS
do
	id $NAME
done

echo ""

echo "All Users have been added"

echo ""

read -p "Shall I undo this task and remove all added users? (y/n)   " ANSWER1
if [ $ANSWER1 = "y" ]
then
	for NAME in $USERS
	do
		userdel -rf $NAME
		echo "${NAME} removed!"
	done
else
	echo "No users deleted"

fi
