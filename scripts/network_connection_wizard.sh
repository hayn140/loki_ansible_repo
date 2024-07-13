#!/bin/bash
echo "
Welcome to the Network Connection Wizard!
This script will automate the process of creating a network connection.
"
sleep 1

echo "Let's get started!
"
# 1. Have the user choose between a DHCP or STATIC Connection (LOOP)
until [[ $a == "1" ]]
do
read -p "Would you like to create a (1) DHCP or (2) STATIC connection? (Choose 1 or 2):  " TYPE
case $TYPE in
	1) CONNECTION=DHCP
	;;
	2) CONNECTION=STATIC
	;;
esac
if [[ ${TYPE} == "1" ]]; then
	echo "You've chosen to create a DCHP connection."
	(( a ++ ))
	sleep 1
elif [[ ${TYPE} == "2" ]]; then
	echo "You've chosen to create a STATIC connection."
	(( a ++ ))
	sleep 1
else
	echo "Invalid Input."
fi
done
# 2. List the available devices
	echo "Here's your list of available DEVICES:
	"
	nmcli dev status
# 3. Have the user choose a device and make sure it's valid before moving forward (LOOP).
	until [[ $b == "1" ]]
	do
		echo "Please type the name of the device on which to configure a connection:"
		read DEVICE
			if [[ $(nmcli dev status | grep -ow ^${DEVICE}) == ${DEVICE} ]]; then
				# grep -o (only list matchign string), -w (Match whole words only)
				echo "Great let's set up a ${CONNECTION} connection on device ${DEVICE}"
				(( b ++ ))
			else
				echo "That device doesn't exist."
			fi
	done
# 4. Let's set up the users chosen DHCP or STATIC connection.
#	A. Keep in mind that if they want a STATIC connection we will need to ask them if they already have:
#		i. IP
#		ii. Subnet
#		iii. DNS
#		iv. Gateway
#	B. If not, then we need to ask them if they already have a DHCP connection
#		i. If they do, then we ask for the name of the connection and turn it on
#		ii. Then we look at the device to gather those four pieces of information
#	C. If they don't already have a DHCP connection, we can create one for them
#		i. Then we create the connection and turn it on
#		ii. Then we look at the device to gather those four pieces of information
sleep 2
# 4.1 Steps to create a DHCP connection.
if [[ ${CONNECTION} == "DHCP" ]]; then
	echo "What would you like to name your connection?"
	read DHCP_NAME
	echo "Would you like this connection to connect automatically upon boot up? (y/n)"
	read ANSWER1
		case ${ANSWER1} in
			y) AUTOCONNECT="yes"
			;;
			n) AUTOCONNECT="no"
			;;
		esac
	NM_TYPE=$(nmcli dev status | grep -w "^${DEVICE}" | awk '{print $2}')
	echo "Creating a ${CONNECTION} connection on ${DEVICE}..."
	sleep 2
	echo "One moment please..."
	sleep 2
	nmcli con add con-name ${DHCP_NAME} ifname ${DEVICE} type ${NM_TYPE} autoconnect ${AUTOCONNECT}	ipv4.method auto
	echo "Would you like to activate this connection? (y/n)
	"
	read ANSWER2
		if [[ ${ANSWER2} == "y" ]]; then
			nmcli con up ${DHCP_NAME}
			echo "Here is a verification of ${DEVICE}'s connection:
			"
			nmcli dev status
		elif [[ ${ANSWER2} == "n" ]]; then
			echo "Your ${DHCP_NAME} ${CONNECTION} connection was not activated.
			"
			sleep 1
			echo "Here is a verification of your connections
			"
			nmcli con show
		else
			echo "Invalid input. The connection was not activated.
			"
			sleep 1
			echo "Here is a verification of your connections:
			"
			nmcli con show
		fi
	echo "
	"
	echo "This is your current active network Configuration:
	"
	sleep 1
	nmcli dev show ${DEVICE} | grep -i "ip4.address*"
	sleep 1
	nmcli dev show ${DEVICE} | grep -i "ip4.gateway*"
	sleep 1
	nmcli dev show ${DEVICE} | grep -i "ip4.dns*"
#
# 4.2 Steps to create a STATIC connection
# 4.2.1 First we ask if they have a the information needed to create a STATIC connection.

elif [[ ${CONNECTION} = STATIC ]]; then
	echo "Do you already have the following prepared to create your STATIC connection: (y/n)
	
	1. IP Address
	2. Subnet Mask
	2. DNS IP
	3. Default Gateway IP
	"
	read ANSWER3
		if [[ ${ANSWER3} == "y" ]]; then
			echo "Great. Please specify the following:"
				read -p "-IP Address/CDIR-Subnet Mask (i.e. 192.168.10.20/24):  " IP_ADDR
				read -p "-Default Gateway IP:  " GW_ADDR
				read -p "-DNS IP:  " DNS_ADDR
			echo "What would you like to name your connection?"
			read DHCP_NAME
			echo "Would you like this connection to connect automatically upon boot up? (y/n)"
 			read ANSWER1
 				case ${ANSWER1} in
 					y) AUTOCONNECT="yes"
 					;;
 					n) AUTOCONNECT="no"
 					;;
 				esac
 			NM_TYPE=$(nmcli dev status | grep -w "^${DEVICE}" | awk '{print $2}')
 			echo "Creating a ${CONNECTION} connection on ${DEVICE}..."
 			sleep 2
 			echo "One moment please..."
 			sleep 2
 			nmcli con add con-name ${DHCP_NAME} ifname ${DEVICE} type ${NM_TYPE} autoconnect ${AUTOCONNECT} ipv4.addresses ${IP_ADDR} ipv4.dns ${DNS_ADDR} ipv4.gateway ${GW_ADDR} ipv4.method manual
			echo "Would you like to activate this connection? (y/n)
        		"
        		read ANSWER2
                		if [[ ${ANSWER2} == "y" ]]; then
                        		nmcli con up ${DHCP_NAME}
                        		echo "Here is a verification of ${DEVICE}'s connection:
                        		"
                        		nmcli dev status
                		elif [[ ${ANSWER2} == "n" ]]; then
                        		echo "Your ${DHCP_NAME} ${CONNECTION} connection was not activated.
                        		"
                        		sleep 1
                        		echo "Here is a verification of your connections
                        		"
                        		nmcli con show
                		else
                        		echo "Invalid input. The connection was not activated.
                        		"
                        		sleep 1
                        		echo "Here is a verification of your connections:
                        		"
                        		nmcli con show
                		fi
        		echo "
        		"
       			echo "This is your current active network Configuration:
        		"
        		sleep 1
        		nmcli dev show ${DEVICE} | grep -i "ip4.address*"
        		sleep 1
        		nmcli dev show ${DEVICE} | grep -i "ip4.gateway*"
        		sleep 1
        		nmcli dev show ${DEVICE} | grep -i "ip4.dns*"	
		elif [[ ${ANSWER3} == "n" ]]; then
			sleep 1
			echo "That's totally fine. I can create a temporary DHCP connection, gather that information, then help you create your STATIC connection. Shall I proceed? (y/n)"
			read ANSWER4
				if [[ ${ANSWER4} == "y" ]]; then
					NM_TYPE=$(nmcli dev status | grep -w "^${DEVICE}" | awk '{print $2}')
					sleep 1
					echo "One moment while I create a temporary DHCP connection..."
					nmcli con add con-name tempDHCP ifname ${DEVICE} type ${NM_TYPE} autoconnect no
					nmcli con up tempDHCP
					
					IP_ADDR=$(nmcli dev show ${DEVICE} | grep -i "ip4.address*" | awk '{print $2}')
                                        GW_ADDR=$(nmcli dev show ${DEVICE} | grep -i "ip4.gateway*" | awk '{print $2}')
                                        DNS_ADDR=$(nmcli dev show ${DEVICE} | grep -i "ip4.dns*" | awk '{print $2}')
					sleep 2
					echo "A temporary DHCP configuration was created with the following configuration:
                        		"
						nmcli dev show ${DEVICE} | grep -i "ip4.address*"
                                        	nmcli dev show ${DEVICE} | grep -i "ip4.gateway*"
                                        	nmcli dev show ${DEVICE} | grep -i "ip4.dns*"
					nmcli con del tempDHCP
					sleep 1
					echo "Let's proceed with creatin your STATIC connection!"
					sleep 1
					echo "What would you like to name your connection?"
                        		read DHCP_NAME
                        		echo "Would you like this connection to connect automatically upon boot up? (y/n)"
                        		read ANSWER1
                                		case ${ANSWER1} in
                                        		y) AUTOCONNECT="yes"
                                        		;;
                                        		n) AUTOCONNECT="no"
                                        		;;
                                		esac
                        		NM_TYPE=$(nmcli dev status | grep -w "^${DEVICE}" | awk '{print $2}')
                        		echo "Creating a ${CONNECTION} connection on ${DEVICE}..."
                        		sleep 2
                        		echo "One moment please..."
                        		sleep 2
                        		nmcli con add con-name ${DHCP_NAME} ifname ${DEVICE} type ${NM_TYPE} autoconnect ${AUTOCONNECT} ipv4.addresses ${IP_ADDR} ipv4.dns ${DNS_ADDR} ipv4.gateway ${GW_ADDR} ipv4.method manual
                        		echo "Would you like to activate this connection? (y/n)
                        		"
                        		read ANSWER2
                                		if [[ ${ANSWER2} == "y" ]]; then
                                		        nmcli con up ${DHCP_NAME}
                                		        echo "Here is a verification of ${DEVICE}'s connection:
                                		        "
                                		        nmcli dev status
                                		elif [[ ${ANSWER2} == "n" ]]; then
                                		        echo "Your ${DHCP_NAME} ${CONNECTION} connection was not activated.
                                		        "
                                		        sleep 1
                                		        echo "Here is a verification of your connections
                                		        "
                                		        nmcli con show
                                		else
                                		        echo "Invalid input. The connection was not activated.
                                		        "
                                		        sleep 1
                                		        echo "Here is a verification of your connections:
                                		        "
                                		        nmcli con show
                                		fi
                        		echo "
                        		"
                        		echo "This is your current active network Configuration:
                        		"
                        		sleep 1
                        		nmcli dev show ${DEVICE} | grep -i "ip4.address*"
                        		sleep 1
                        		nmcli dev show ${DEVICE} | grep -i "ip4.gateway*"
                        		sleep 1
                        		nmcli dev show ${DEVICE} | grep -i "ip4.dns*"

				elif [[ ${ANSWER4} == "n" ]]; then
					echo "Please come back when you have the information ready!"
					sleep 1
					echo "Quitting Network Connection Wizard."
					exit 1
				else
					echo "Invalid input. Quitting Network Connection Wizard."
                        		exit 1
				fi

		else 
			echo "Invalid input. Quitting Network Connection Wizard."
			exit 1
		fi	
else
	echo "Invalid input. Quitting Network Connection Wizard."
	exit 1		
fi
