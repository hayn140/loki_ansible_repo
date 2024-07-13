#!/bin/bash
# 1.Create a new user
echo "

This is a script that will help automate the process of creating a user.
We'll first create the user, specify any comments, and set their home direcotry.
Then we'll add the user to any primary or secondary groups they need to be added to.
We'll create those groups if they don't yet exist.
Lastly, we'll set the password for your user and print a confirmation.

"
sleep 3
#
echo "Let's get started and create a new user!"
sleep 1
#
#	a. Prompt for Username and input it into variable USER
#
		echo "First, specify the username for this user:"
		read USER
#
#	b. Prompt for a comment and input it into variable COMMENT
#
		echo "Great! Now specify any comments you'd like this user to have:"
                read COMMENT
#
#	c. Prompt for home directory location, then execute the #useradd command
		echo "Thank you. Do you want the user's home directory to be at /home/${USER}? (y/n)"
		read ANSWER1
		if [[ "${ANSWER1}" == "y" ]]; then
			useradd -m -c "${COMMENT}" ${USER}
		elif [[ "$ANSWER1" == "n" ]]; then
			echo "Please specify the full path to the user's home directory:"
			read HOMEDIR
			useradd -d "${HOMEDIR}" -c "${COMMENT}" ${USER}
#
		else
			echo "Invalid input. User was not created."
			exit 1
		fi	
# 2.Prompt if you want the user to be added to any groups (y/n)
#
until [[ "${ANSWER3}" == "n" ]]
do
echo "Do you want the user to be added to any other groups? (y/n)"
read ANSWER3
#
# Prompt for the name of the group user should be added to and input it into variable GROUP
#
if [[ "${ANSWER3}" == "y" ]]; then
        echo "What's the name of the group the user should be added to?"
        read GROUP
                if [[ $(grep "${GROUP}\:x\:" /etc/group) == ${GROUP}* ]]; then
                        echo "Group ${GROUP} DOES exist"
                else
                        echo "${GROUP} DOESN'T exist. Creating it now..."
                        sleep 2
			echo "One Moment Please..."
			sleep 2
			groupadd "${GROUP}"
                	echo "Group ${GROUP} successfully created"
		fi
        echo "Should this be the user's Primary Group? (y/n)"
        read ANSWER4
                if [[ "${ANSWER4}" == y ]]; then
                        usermod -g "${GROUP}" ${USER}
                        echo "Group ${GROUP} was added to ${USER} as a Primary Group"
                elif [[ "${ANSWER4}" == n ]]; then
                        usermod -aG "${GROUP}" ${USER}
                        echo "Group ${GROUP} was added to ${USER} as a Secondary Group"
                else
                        echo "Invalid Input. Groups weren't Modified"
                fi
elif [[ "${ANSWER3}" == "n" ]]; then
        echo "User ${USER} is part of the following (Primary:Secondary) groups:"
        groups "${USER}"
else
        echo "Invalid Input. Groups weren't Modified"
fi
#
done
#
# 3.Set the User's passwd
#
echo "Lastly, let's set the user's password"
#
passwd ${USER}
echo "
"
#
# 4.Give a visual confirmation of everything that was done.
#
echo "Your user $USER has been created. Please wait as I print verification..."
sleep 4
echo "
"
echo "Here's ${USER}'s /etc/passwd entry:"
getent passwd ${USER}
echo "
"
echo "Here's ${USER}'s Primary & Secondary Groups:"

groups ${USER}
#
#
