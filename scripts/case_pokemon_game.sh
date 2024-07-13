#!/bin/bash
echo ""
echo "Aloha! This script was designed by Loki Alohikea

We are going to play a Pokemon game and use CASE to illustrate switching variables."
echo ""
sleep 4

until [ "$ANSWER3" = "n" ]
do

read -p "What gender pokemon would you like:
	M : Male
	F : Female
	N : Non-Binary

Gender (M,F,N):   " ANSWER1
echo ""

case $ANSWER1 in
	M)
		GENDER1=he
		GENDER2=his
		POSSESSIVE=has;;

	F)
		GENDER1=she
		GENDER2=her
		POSSESSIVE=has
		;;

	N)
		GENDER1=they
		GENDER2=their
		POSSESSIVE=have
		;;
esac

echo "Choose your pokemon:
	A : Pikachu
	B : Squirtle
	C : Charmander
	D : Bulbasaur
"
read -p "Which pokemon do you choose? (A-D)   " POKEMON

case $POKEMON in
	
	A)
		NAME=Pikachu
		TYPE=Electric
		SPECIAL_MOVE="Thunder Bolt"
		HP=78
		ATTACK=23
		PREP=an
		;;

	B)
		NAME=Squirtle
		TYPE=Water
		SPECIAL_MOVE="Bubble Beam"
		HP=67
		ATTACK=30
		PREP=a
		;;

	C)
		NAME=Charmander
		TYPE=Fire
		SPECIAL_MOVE="Flamethrower"
		HP=80
		ATTACK=32
		PREP=a
		;;

	D)
		NAME=Bulbasaur
		TYPE=Leaf
		SPECIAL_MOVE="Solar Beam"
		HP=74
		ATTACK=34
		PREP=a
		;;

esac
echo "
"
echo "Congratulations you've got $NAME!"

echo ""
sleep 2
echo "$NAME is $PREP $TYPE type pokemon, $GENDER2 special move is $SPECIAL_MOVE"

echo ""
sleep 2
echo "$NAME currently has $HP HP and $GENDER1 $POSSESSIVE an attack power of $ATTACK!"
echo ""
sleep 2

echo "Take care of $NAME and ${GENDER1}'ll take care of you"
echo ""
sleep 1
read -p "Would you like to switch pokemons? (y/n)   " ANSWER2

if [ $ANSWER2 = "y" ]
then
	ANSWER3=y
	clear
elif [ $ANSWER2 = "n" ]
then
	ANSWER3=n
fi

done

echo ""
echo "Bug Watcher Jordan spotted you...Get ready for Battle!"
sleep 2
