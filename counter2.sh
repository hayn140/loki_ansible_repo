#!/bin/bash
echo ""
echo "Aloha! This script was designed by Loki Alohikea!"
echo ""
echo "E helu kakou! Let's count together! I can count forwards and backwards."
sleep 3

until [ "$ANSWER1" = "n" ]
do
echo ""
read -p "Enter the number to start counting from:   " NUMBERA
echo ""

read -p "Enter the number to stop counting at:   " NUMBERB
echo ""

if [ $NUMBERA -lt $NUMBERB ]
then
	until [ "$NUMBERA" -gt "$NUMBERB" ]
	do
		echo "Number: $NUMBERA"
		(( NUMBERA +=1 ))
		sleep 1
	done
elif [ $NUMBERA -gt $NUMBERB ]
then
	while [ $NUMBERA -ge $NUMBERB ]
	do
		echo "Number: $NUMBERA"
		(( NUMBERA -=1 ))
		sleep 1
	done
elif [ $NUMBERA -eq $NUMBERB ]
then
	echo "These two numbers are equal."
else
	echo "Invalid input"
fi
echo ""

read -p "Do you want to count again? (y/n)  " ANSWER1

done
