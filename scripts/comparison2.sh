#!/bin/bash
echo ""
echo "Aloha! This script was designed by Loki Alohikea"
echo ""
sleep 2
echo "Let's compare numbers together!"

until [ "$ANSWER1" = "n" ]
do
echo ""
read -p "Please enter the first number:	  " NUMBERA
sleep 1
echo ""

read -p "Please enter the second number:   " NUMBERB
sleep 1
echo ""

echo "Let's compare $NUMBERA to $NUMBERB"
echo ""
sleep 1
echo "Thinking..."
echo ""
sleep 1
if [ $NUMBERA -gt $NUMBERB ]
then
	echo "$NUMBERA is greater than $NUMBERB"
elif [ $NUMBERA -lt $NUMBERB ]
then
	echo "$NUMBERB is greater than $NUMBERA"
elif [ $NUMBERA -eq $NUMBERB ]
then
	echo "These two numbers are equal to each other"
else
	echo "Invalid Input. Check to make sure these two numbers are integers"
fi

echo ""

read -p "Would you like to compare two more numbers? (y/n)	" ANSWER1

done
