#!/bin/bash
/usr/bin/echo "
Welcome to the Comprehensive Review!

We're going to complete all 30 objectives!

Most of this script is automated, but the following objectives will require input!

Objectives: 	#10
		#23
		#25
		#27
		#28
		#29

You will need to be familiar with # fdisk in order to complete these objectives!

Please follow all instructions carefully and be careful when you are typing!

Good luck!
"
sleep 10

# Set Up Your Hostname
#--------------------------------------------------------------
/usr/bin/echo ""
/usr/bin/echo "First, let's set up your hostname"
read -p "What is your first name? " FIRSTNAME
read -p "What is your last name? " LASTNAME

/usr/bin/hostnamectl set-hostname "${FIRSTNAME}.$LASTNAME-rhcsa9.yellowtail.tech"
sleep 1
/usr/bin/echo "Hostname was set, an 'exec bash' will be run at the end of this script!"
sleep 1
/usr/bin/echo ""
# Objective 1
#--------------------------------------------------------------
/usr/bin/echo "Objective 1
"
sleep 5
/usr/bin/echo "Creating the following users:

eetienne : Emmanuel Etiene
jwest : Jerry West
ppaul : Pierre Paul
"
sleep 1
/usr/sbin/useradd -m -c "Emmanuel Etiene" eetienne
sleep 1
/usr/sbin/useradd -m -c "Jerry West" jwest
sleep 1
/usr/sbin/useradd -m -c "Pierre Paul" ppaul

/usr/bin/echo ""
/usr/bin/echo "Here's a confirmation of these user accounts created. 

/etc/passwd:
"
sleep 1
/usr/bin/grep "eetienne" /etc/passwd
sleep 1
/usr/bin/grep "jwest" /etc/passwd
sleep 1
/usr/bin/grep "ppaul" /etc/passwd
/usr/bin/echo ""
sleep 2
# Objective 2
#--------------------------------------------------------------
/usr/bin/echo "Objective 2
"
sleep 5
/usr/bin/echo "Let's add these three users to the group 'ytstudents'
"
sleep 1
/usr/sbin/groupadd ytstudents
sleep 1
/usr/sbin/usermod -aG ytstudents eetienne
sleep 1
/usr/sbin/usermod -aG ytstudents jwest
sleep 1
/usr/sbin/usermod -aG ytstudents ppaul
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Here's a confirmation of their group memberships: "
sleep 1
/usr/sbin/lid eetienne
/usr/bin/echo ""
sleep 1
/usr/sbin/lid jwest
/usr/bin/echo ""
sleep 1
/usr/sbin/lid ppaul
/usr/bin/echo ""
sleep 1
# Objective 3
#--------------------------------------------------------------
/usr/bin/echo "Objective 3
"
sleep 5

/usr/bin/echo "Creating user 'mcosby' and then adding them to the group 'media' and 'ytstudents'
"
sleep 1
/usr/sbin/groupadd media
sleep 1
/usr/sbin/useradd -m -G media,ytstudents mcosby
sleep 1
/usr/bin/echo "Here's a confirmation for mcosby:
"
/usr/bin/grep "mcosby" /etc/passwd
/usr/bin/echo ""
sleep 1
/usr/sbin/lid mcosby
/usr/bin/echo ""
sleep 1
# Objective 4
#--------------------------------------------------------------
/usr/bin/echo "Objective 4"
sleep 5
/usr/bin/echo "Setting passwords for all users!
"
/usr/bin/echo "eetienne:certb42024" | chpasswd
sleep 1
/usr/bin/passwd -S eetienne
/usr/bin/echo ""
sleep 1
/usr/bin/echo "jwest:certb42024" | chpasswd
sleep 1
/usr/bin/passwd -S jwest
/usr/bin/echo ""
sleep 1
/usr/bin/echo "ppaul:certb42024" | chpasswd
sleep 1
/usr/bin/passwd -S ppaul
/usr/bin/echo ""
sleep 1
/usr/bin/echo "mcosby:certb42024" | chpasswd
sleep 1
/usr/bin/passwd -S mcosby
/usr/bin/echo ""
sleep 1
/usr/bin/echo ""
# Objective 5
#--------------------------------------------------------------
/usr/bin/echo "Objective 5
"
sleep 5
/usr/bin/echo "Expiring all user's passwords to force them to change their passwords upon their next login..."
sleep 3
/usr/bin/passwd -e eetienne
sleep 1
/usr/bin/passwd -e jwest
sleep 1
/usr/bin/passwd -e ppaul
sleep 1
/usr/bin/passwd -e mcosby
sleep 1
/usr/bin/echo ""
# Objective 6
#--------------------------------------------------------------
/usr/bin/echo "Objective 6
"
sleep 5
/usr/bin/echo "Adding user 'pcoelho' with UID 3719"
/usr/bin/echo ""
sleep 1
/usr/sbin/useradd -m -u 3719 pcoelho
sleep 2
/usr/bin/grep "pcoelho" /etc/passwd
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Setting password for 'pcoelho'"
/usr/bin/echo ""
sleep 1
/usr/bin/echo "pcoelho:certb42024" | chpasswd
sleep 2
/usr/bin/echo "Password for 'pcoelho' set successfully
"
sleep 1
# Objective 7
#--------------------------------------------------------------
/usr/bin/echo "Objective 7
"
sleep 5
/usr/bin/echo "Adding user 'tfox'"
sleep 1
/usr/sbin/useradd -m tfox
sleep 1
/usr/bin/grep "tfox" /etc/passwd
sleep 1
/usr/bin/echo "Locking user 'tfox' account using CHAGE"
sleep 1
/usr/bin/chage -E 0 tfox
/usr/bin/echo ""
sleep 1
/usr/bin/chage -l tfox
sleep 1
# Objective 8
#--------------------------------------------------------------
/usr/bin/echo "Objective 8
"
sleep 5
/usr/bin/echo "Creating directory /books/bashking/ and changing the owner to group ytstudents"
sleep 2
/usr/bin/mkdir -p /books/bashking
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Directory /books/bashking/ created"
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Changing group ownership of /books/bashking/ to 'ytstudents'"
/usr/bin/echo ""
sleep 1
/usr/bin/chown :ytstudents /books/bashking/
/usr/bin/ls -ld /books/bashking/
/usr/bin/echo ""
sleep 1
# Objective 9
#--------------------------------------------------------------
/usr/bin/echo "Objective 9
"
sleep 5
/usr/bin/echo "Giving group 'ytstudents' rwx perms to /books/bashking/"
/usr/bin/chmod g=rwx /books/bashking/
/usr/bin/echo ""
sleep 1
/usr/bin/ls -ld /books/bashking/
sleep 1
# Objective 10
#--------------------------------------------------------------
/usr/bin/echo "Objective 10
"
sleep 5
/usr/bin/echo "Let's create a backup of the chrony.conf file in /var/tmp/backup."
/usr/bin/echo ""
/usr/bin/mkdir -p /var/tmp/backup/
/usr/bin/echo "First, let's find the chrony.conf file..."
sleep 2
/usr/bin/echo "Searching..."
sleep 2
/usr/bin/echo ""
/usr/bin/find / -type f -name "chrony.conf"
sleep 1

until [[ $a == 1 ]]
do
/usr/bin/echo ""
/usr/bin/echo "Please type the full path to the chrony.conf file you want to make a backup for:"
read ANSWER1
/usr/bin/echo ""

if [[ $ANSWER1 == $(ls ${ANSWER1}) ]]
then
	/usr/bin/cp $ANSWER1 /var/tmp/backup/chrony.conf.bak
	/usr/bin/echo "Backup of $ANSWER1 was created!"
	sleep 1
	/usr/bin/echo "Verifying contents of /var/tmp/backup/:"
	/usr/bin/ls /var/tmp/backup/
	sleep 1
	(( a ++ ))
else
	/usr/bin/echo "That file doesn't exist."
fi
done

sleep 1
# Objective 11
#-----------------------------------------------------------------------------
/usr/bin/echo ""
/usr/bin/echo "Objective 11"
sleep 5

/usr/bin/echo ""
/usr/bin/echo "Let's give user 'pcoelho' rw perms to /var/tmp/backup/chrony.conf.bak file without changing the ownership."
/usr/bin/echo ""
sleep 1
/usr/bin/setfacl -m u:pcoelho:rw /var/tmp/backup/chrony.conf.bak
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Here's a confirmation"
/usr/bin/echo ""
/usr/bin/getfacl /var/tmp/backup/chrony.conf.bak
sleep 3
/usr/bin/echo ""
sleep 1
# Objective 12
#-----------------------------------------------------------------------------
/usr/bin/echo "Objective 12"
/usr/bin/echo ""
sleep 5

/usr/bin/echo "Let's give 'root' full permissions to the /var/tmp/backup/ directory!"
sleep 1
/usr/bin/echo ""
/usr/bin/chmod u=rwx /var/tmp/backup
sleep 1
/usr/bin/ls -ld /var/tmp/backup
sleep 3
/usr/bin/echo ""
# Objective 13
#-----------------------------------------------------------------------------
/usr/bin/echo "Objective 13"
/usr/bin/echo ""
sleep 5
/usr/bin/echo "Let's remove all of the permissions for others on /var/tmp/backup."
/usr/bin/echo ""
/usr/bin/chmod o-rwx /var/tmp/backup
sleep 1
/usr/bin/ls -ld /var/tmp/backup
/usr/bin/echo ""
sleep 3
# Objective 14
#-----------------------------------------------------------------------------
/usr/bin/echo "Objective 14"
/usr/bin/echo ""
sleep 5
/usr/bin/echo "Let's create a file 'the_alchemist.pdf' in pcoelho's home directory!"
/usr/bin/echo ""
/usr/bin/touch /home/pcoelho/the_alchemist.pdf
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Contents of /home/pcoelho :"
/usr/bin/echo ""
/usr/bin/ls /home/pcoelho
sleep 1
/usr/bin/echo ""
# Objective 15
#-----------------------------------------------------------------------------
/usr/bin/echo "Objective 15"
/usr/bin/echo ""
sleep 5
/usr/bin/echo "Let's set the group owner of the file 'the_alchemist.pdf' to pcoelho"
/usr/bin/echo ""
sleep 1
/usr/bin/chown :pcoelho /home/pcoelho/the_alchemist.pdf
sleep 1
/usr/bin/ls -l /home/pcoelho/the_alchemist.pdf
sleep 3
/usr/bin/echo ""
# Objective 16
#----------------------------------------------------------------------------
/usr/bin/echo "Objective 16"
/usr/bin/echo ""
sleep 5
/usr/bin/echo "Let's add a new repository. Please choose a name for your repository. 

PLEASE DO NOT INCLUDE ANY SPACES!

Example: For EPEL_REPO.repo type: EPEL_REPO

"
read ANSWER2
sleep 2

/usr/bin/touch /etc/yum.repos.d/${ANSWER2}.repo

/usr/bin/echo "[${ANSWER2}]
name= Additional $ANSWER2 repository from Comp Review Ex. 16
baseurl=https://repos.del.extreme-ix.org/epel/9/Everything/x86_64/
gpgcheck=0
enabled=1" >> /etc/yum.repos.d/${ANSWER2}.repo

sleep 1
/usr/bin/echo ""
/usr/bin/echo "Here's your repo file in /etc/yum.repos.d/:"
sleep 1
/usr/bin/ls /etc/yum.repos.d/${ANSWER2}.repo
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Here's the contents of your ${ANSWER2}.repo file"
/usr/bin/echo ""
/usr/bin/cat /etc/yum.repos.d/${ANSWER2}.repo
/usr/bin/echo ""
sleep 4
/usr/bin/echo "Let's check our repolist"
/usr/bin/echo ""
/usr/bin/yum repolist
/usr/bin/echo ""
sleep 4
# Objective 17
#----------------------------------------------------------------------------
/usr/bin/echo "Objective 17"
/usr/bin/echo ""
sleep 5
/usr/bin/echo "Let's create group aws4jobs"
/usr/bin/echo ""
sleep 1
/usr/sbin/groupadd aws4jobs
sleep 1
/usr/bin/grep "aws4jobs" /etc/group
sleep 3
/usr/bin/echo ""
# Objective 18
# ------------------------------------------------------------------------
/usr/bin/echo "Objective 18"
/usr/bin/echo ""
sleep 5
/usr/bin/echo "Let's create leo and willis and add 'aws4jobs' as a secondary group!"
/usr/bin/echo ""
sleep 1
/usr/sbin/useradd -m -G aws4jobs leo
/usr/bin/echo ""
sleep 1
/usr/bin/grep leo /etc/passwd
sleep 1
/usr/bin/groups leo
sleep 1
/usr/bin/echo ""

/usr/sbin/useradd -m -G aws4jobs willis
/usr/bin/echo ""
sleep 1
/usr/bin/grep willis /etc/passwd
sleep 1
/usr/bin/groups willis
sleep 1
/usr/bin/echo ""

/usr/bin/echo "Next, we'll add user lfjs with a non-interactive shell."
/usr/bin/echo ""
sleep 1
/usr/sbin/useradd -s /sbin/nologin lfjs
/usr/bin/echo ""
sleep 1
/usr/bin/grep lfjs /etc/passwd
/usr/bin/echo ""
sleep 1

/usr/bin/echo "Lastly, let's set all of their passwords!"
/usr/bin/echo ""
sleep 1
/usr/bin/echo leo:certb42024 | chpasswd
sleep 1
/usr/bin/echo willis:certb42024 | chpasswd
sleep 1
/usr/bin/echo "Passwords for leo and willis have been set!"
/usr/bin/echo ""
# Objective 19
#- -------------------------------------------------------------------------
/usr/bin/echo "Objective 19"
/usr/bin/echo ""
sleep 5

/usr/bin/echo "For this objective:
1. We'll create directory /yellowtail/class
2. Set the group owner on this directory to group 'ytstudents'
3. Ensure all future files created in this direcotry retain their ytstudents group owner.
4. Ensure that members of group ytstudents can modify any files in this directory
5. Ensure that 'others' have no permissions.
"
sleep 5
/usr/bin/echo "Let's begin by creating the /yellowtail/class/ directory!"
sleep 1
/usr/bin/echo ""
/usr/bin/mkdir -v -p /yellowtail/class/
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Let's set the group owner to 'ytstudents'"
sleep 1
/usr/bin/chown -v :ytstudents /yellowtail/class
/usr/bin/echo ""
sleep 1
/usr/bin/ls -ld /yellowtail/class
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Let's SETGID on /yellowtail/class"
/usr/bin/chmod -v g+s /yellowtail/class
/usr/bin/echo ""
sleep 1
/usr/bin/ls -ld /yellowtail/class
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Let's give group 'ytstudents' modify permissions to /yellowtail/class"
/usr/bin/echo ""
sleep 1
/usr/bin/chmod -v g+rwx /yellowtail/class
/usr/bin/echo ""
sleep 1
/usr/bin/ls -ld /yellowtail/class
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Let's remove all permissions for 'others'"
/usr/bin/echo ""
/usr/bin/chmod -v o-rwx /yellowtail/class
/usr/bin/echo ""
/usr/bin/ls -ld /yellowtail/class
/usr/bin/echo ""
sleep 1

# Objective 20
#----------------------------------------------------------------------------
/usr/bin/echo "Objective 20"
/usr/bin/echo ""
sleep 5

/usr/bin/echo "Let's create some files in /yellowtail/class/ and make sure they've retained their group ownership!"
/usr/bin/echo ""

/usr/bin/touch /yellowtail/class/{Jira1,Jira2,Fargate,Kinesis,Spacewalk,Neptune,Containers}
/usr/bin/echo ""
sleep 1
/usr/bin/ls -l /yellowtail/class/
/usr/bin/echo ""
sleep 5

# Objective 21
#----------------------------------------------------------------------------
/usr/bin/echo "Objective 21"
/usr/bin/echo ""
sleep 5

/usr/bin/echo "Let's find all files owned by group 'ytstudents' and change the permissions to 621 using find and -exec."
/usr/bin/echo ""
sleep 1
/usr/bin/echo "First let's find the files owned by group 'ytstudents'"
/usr/bin/echo ""
/usr/bin/find / -type f -group "ytstudents" 2>/dev/null -ls
/usr/bin/echo ""
sleep 4
/usr/bin/echo "Great, now let's change all those file's permissions to 621"
/usr/bin/echo ""
sleep 2
/usr/bin/echo "Processing..."
sleep 2
/usr/bin/echo ""
/usr/bin/find / -type f -group "ytstudents" 2>/dev/null -exec chmod 621 {} \;
/usr/bin/find / -type f -group "ytstudents" 2>/dev/null -ls
/usr/bin/echo ""
sleep 5

# Objective 22
#---------------------------------------------------------------------------
/usr/bin/echo "Objective 22"
/usr/bin/echo ""
sleep 5
/usr/bin/echo "Let's search for all the lines in /etc/passwd with string 'jwest' and redirect the output to the file /tmp/users/jwest"
/usr/bin/echo ""
/usr/bin/echo "First, let's create the directory /tmp/users/"
sleep 1
/usr/bin/mkdir -v -p /tmp/users/
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Let's grep for string 'jwest' in /etc/passwd"
/usr/bin/echo ""
sleep 1
/usr/bin/grep -n "jwest" /etc/passwd
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Now let's put that output into file /tmp/users/jwest"
/usr/bin/echo ""
sleep 1
/usr/bin/grep -n "jwest" /etc/passwd > /tmp/users/jwest
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Contents of the file /tmp/uses/jwest : "
/usr/bin/cat /tmp/users/jwest
/usr/bin/echo ""
sleep 4
# Objective 23
#----------------------------------------------------------------------------
/usr/bin/echo "Objective 23"
/usr/bin/echo ""
sleep 5

/usr/bin/echo "Let's create an XFS filesystem:"
/usr/bin/echo ""
sleep 4
/usr/bin/echo "Here's a list of your available block devices:"
/usr/bin/echo ""
sleep 1
/usr/bin/lsblk
sleep 3
/usr/bin/echo "
"
until [[ $b == 1 ]]
do
/usr/bin/echo "Please type the FULL path of the block device you wish to partition.

Please choose from the following:
"
/usr/bin/ls -1 /dev/?d?

/usr/bin/echo "
"
read -p "Chosen Block Device (FULL PATH):  " DEVICE1

	if [[ $DEVICE1 == "$(ls ${DEVICE1})" ]]
	then
		/usr/bin/echo "Great, let's use # fdisk to partition $DEVICE1"
		sleep 1
		/usr/bin/echo ""
		/usr/bin/echo "Please set your partition as follows:

		-Size: +1250M
		-Type: 8e (Linux LVM)"
		/usr/bin/echo ""
		sleep 5
		(( b ++ ))
	else
		/usr/bin/echo "Invalid input."
	fi
done

/usr/sbin/fdisk $DEVICE1
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Great here are all of your partitions:"
sleep 1
/usr/bin/echo ""
/usr/bin/lsblk
sleep 4

until [[ $c == 1 ]]
do
/usr/bin/echo ""
/usr/bin/echo "Which partition do you want to mark as a Physical Volume?"
/usr/bin/echo ""
/usr/bin/echo "Choose from the following:"
/usr/bin/echo ""
sleep 1
/usr/bin/ls -1 /dev/?d??
/usr/bin/echo ""
sleep 1
read -p "Chosen partition:  " PARTITION1
/usr/bin/echo ""

if [[ $PARTITION1 == $(ls ${PARTITION1}) ]]
then
	/usr/bin/echo "You've chosen to mark $PARTITION1 as a Physical Volume!"
	/usr/sbin/pvcreate $PARTITION1
	/usr/bin/echo ""
	sleep 2
	(( c ++ ))
else
	/usr/bin/echo "Invalid Input"
fi
done

sleep 2
/usr/bin/echo "Let's add the Physical Volume $PARTITION1 to a Volume Group."
sleep 2
/usr/bin/echo ""
/usr/bin/echo "Let's create a new Volume Group for this Review"
/usr/bin/echo ""
sleep 1
read -p "Please type a name for your new Volume Group (no spaces):  " VGROUP
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Creating Volume Group $VGROUP using Physical Volume $PARTITION1"
/usr/bin/echo ""
sleep 2
/usr/bin/echo "One moment please..."
/usr/bin/echo ""
sleep 1
/usr/sbin/vgcreate $VGROUP $PARTITION1
sleep 1
/usr/bin/echo ""
sleep 2
/usr/bin/echo "Your Volume Group $VGROUP has been created!"
/usr/bin/echo ""
/usr/sbin/vgs
/usr/bin/echo ""
sleep 4

read -p "Please type a name for your Logical Volume (no spaces):  " LVOLUME1
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Great! Let's create a Logical Volume with the following:

Name:		$LVOLUME1
Size: 		1200M
VG: 		$VGROUP
TYPE: 		XFS
Mounted to:	/yellowtail_docx
"
sleep 4

/usr/sbin/lvcreate -n $LVOLUME1 -L 1200M $VGROUP
/usr/bin/echo ""
sleep 2
/usr/sbin/mkfs.xfs /dev/mapper/${VGROUP}-${LVOLUME1}
/usr/bin/echo ""
sleep 2
/usr/bin/mkdir -v /yellowtail_docx
/usr/bin/echo ""
sleep 2
/usr/bin/mkdir -p /etc/fstab_bak/
/usr/bin/echo "

BACKING UP /etc/fstab to /etc/fstab_bak/ directory:

"
/usr/bin/cp /etc/fstab /etc/fstab_bak/fstab-$(date +%H-%M_%m-%d-%y).bak
/usr/bin/ls /etc/fstab*
sleep 4

/usr/bin/echo "

UPDATING /etc/fstab

"

/usr/bin/echo "/dev/mapper/${VGROUP}-${LVOLUME1}   /yellowtail_docx   xfs   defaults,nofail   0 0" >> /etc/fstab
/usr/bin/echo ""
/usr/bin/cat /etc/fstab 
sleep 5
/usr/bin/echo ""

/usr/sbin/partprobe
sleep 2
/usr/bin/echo "Mounting all devices in /etc/fstab"

/usr/bin/mount -a
/usr/bin/echo ""
/usr/bin/df -Th 
sleep 4
/usr/bin/echo "You've successfully created an XFS filesystem and mounted it to /yellowtail_docx"
/usr/bin/echo ""
# Objective 24
#-----------------------------------------------------------------------
/usr/bin/echo "Objective 24"
/usr/bin/echo ""
sleep 5

/usr/bin/echo "Let's copy all contents of /yellowtail/class to /yellowtail_docx."
/usr/bin/echo ""
/usr/bin/mkdir -v /yellowtail_docx
/usr/bin/cp /yellowtail/class/* /yellowtail_docx
sleep 1
/usr/bin/echo "Confirming contents of both directories:"
sleep 1
/usr/bin/echo "/yellowtail/class : "
/usr/bin/echo ""
/usr/bin/ls /yellowtail/class
/usr/bin/echo "
"
sleep 1

/usr/bin/echo "/yellowtail_docx : "
/usr/bin/echo ""
/usr/bin/ls /yellowtail_docx
/usr/bin/echo "
"
sleep 5

# Objective 25
#------------------------------------------------------------------------
/usr/bin/echo "Objective 25"
/usr/bin/echo ""
sleep 5

/usr/bin/echo "Let's create an EXT4 filesystem:"
/usr/bin/echo ""
sleep 4
/usr/bin/echo "Here's a list of your available block devices:"
/usr/bin/echo ""
sleep 1
/usr/bin/lsblk
sleep 3
/usr/bin/echo "
"
until [[ $d == 1 ]]
do
/usr/bin/echo "Please type the FULL path of the block device you wish to partition.

Please choose from the following:
"
/usr/bin/ls -1 /dev/?d?

/usr/bin/echo "
"
read -p "Chosen Block Device (FULL PATH):  " DEVICE2

	if [[ $DEVICE2 == "$(ls ${DEVICE2})" ]]
	then
		/usr/bin/echo "Great, let's use # fdisk to partition $DEVICE2"
		sleep 1
		/usr/bin/echo ""
		/usr/bin/echo "Please set your partition as follows:

		-Size: +570M
		-Type: 8e (Linux LVM)"
		/usr/bin/echo ""
		sleep 5
		(( d ++ ))
	else
		/usr/bin/echo "Invalid input."
	fi
done

/usr/sbin/fdisk $DEVICE2
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Great here are all of your partitions:"
sleep 1
/usr/bin/echo ""
/usr/bin/lsblk
sleep 4

until [[ $e == 1 ]]
do
/usr/bin/echo ""
/usr/bin/echo "Which partition do you want to mark as a Physical Volume?"
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Choose from the following:"
/usr/bin/echo ""
/usr/bin/ls -1 /dev/?d??
/usr/bin/echo ""
sleep 1
read -p "Chosen partition:  " PARTITION2
/usr/bin/echo ""

if [[ $PARTITION2 == $(ls ${PARTITION2}) ]]
then
	/usr/bin/echo "You've chosen to mark $PARTITION2 as a Physical Volume!"
	/usr/sbin/pvcreate $PARTITION2
	/usr/bin/echo ""
	sleep 2
	(( e ++ ))
else
	/usr/bin/echo "Invalid Input"
fi
done

sleep 2
/usr/bin/echo "Let's add the Physical Volume $PARTITION2 to Volume Group ${VGROUP}"
sleep 2
/usr/bin/echo "Extending Volume Group $VGROUP to include Physical Volume $PARTITION2"
/usr/bin/echo ""
sleep 2
/usr/bin/echo "One moment please..."
/usr/bin/echo ""
sleep 1
/usr/sbin/vgextend $VGROUP $PARTITION2
sleep 1
/usr/bin/echo ""
sleep 2
/usr/bin/echo "Your Volume Group $VGROUP has been extended to include Physical Volume ${PARTITION2}!"
/usr/bin/echo ""
/usr/sbin/vgs
/usr/bin/echo ""
sleep 4

read -p "Please type a name for your Logical Volume (no spaces):  " LVOLUME2
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Great! Let's create a Logical Volume with the following:

Name:		$LVOLUME2
Size: 		550M
VG: 		$VGROUP
TYPE: 		EXT4
Mounted to:	/sysadmin
"
sleep 4

/usr/sbin/lvcreate -n $LVOLUME2 -L 550M $VGROUP
/usr/bin/echo ""
sleep 2
/usr/sbin/mkfs.ext4 /dev/mapper/${VGROUP}-${LVOLUME2}
/usr/bin/echo ""
sleep 2
/usr/bin/mkdir -v /sysadmin
/usr/bin/echo ""
sleep 2
/usr/bin/echo "

BACKING UP /etc/fstab to /etc/fstab_bak/ directory:

"
/usr/bin/cp /etc/fstab /etc/fstab_bak/fstab-$(date +%H-%M_%m-%d-%y).bak
/usr/bin/ls /etc/fstab*
sleep 4

/usr/bin/echo "

UPDATING /etc/fstab

"

/usr/bin/echo "/dev/mapper/${VGROUP}-${LVOLUME2}   /sysadmin   ext4   defaults,nofail   0 0" >> /etc/fstab
/usr/bin/echo ""
/usr/bin/cat /etc/fstab 
sleep 5
/usr/bin/echo ""

/usr/sbin/partprobe
sleep 2
/usr/bin/echo "Mounting all devices in /etc/fstab"

/usr/bin/mount -a
/usr/bin/echo ""
/usr/bin/df -Th 
sleep 4
/usr/bin/echo "You've successfully created an EXT4 filesystem and mounted it to /sysadmin"
/usr/bin/echo ""
sleep 2
# Objective 26
#-----------------------------------------------------------------------------------
/usr/bin/echo "

Objective 26

"
sleep 5

/usr/bin/echo "Let's redirect a summary of your filesystem space (#df -Th) to a file named /sysadmin/filesystem-space.txt"
/usr/bin/echo ""
sleep 1
/usr/bin/df -Th > /sysadmin/filesystem-space.txt
sleep 2
/usr/bin/echo "Confirming contents of /sysadmin/filesystem-space.txt : "
/usr/bin/echo ""
/usr/bin/cat /sysadmin/filesystem-space.txt
/usr/bin/echo ""
sleep 4

# Objective 27
#-----------------------------------------------------------------------------------
/usr/bin/echo "

Objective 27

"
sleep 5

/usr/bin/echo "Let's Extend the filesystem mounted at /sysadmin to 2G.

This would be Logical Volume :

/dev/mapper/${VGROUP}-${LVOLUME2}
"
/usr/bin/echo ""
sleep 4
/usr/bin/echo "Here's a list of your available block devices:"
/usr/bin/echo ""
sleep 1
/usr/bin/lsblk
sleep 3
/usr/bin/echo "
"
until [[ $f == 1 ]]
do
/usr/bin/echo "Please type the FULL path of the block device you wish to partition.

Please choose from the following:
"
/usr/bin/ls -1 /dev/?d?

/usr/bin/echo "
"
read -p "Chosen Block Device (FULL PATH):  " DEVICE3

	if [[ $DEVICE3 == "$(ls ${DEVICE3})" ]]
	then
		/usr/bin/echo "Great, let's use # fdisk to partition $DEVICE3"
		sleep 1
		/usr/bin/echo ""
		/usr/bin/echo "Please set your partition as follows:

		-Size: +1600M
		-Type: 8e (Linux LVM)"
		/usr/bin/echo ""
		sleep 5
		(( f ++ ))
	else
		/usr/bin/echo "Invalid input."
	fi
done

/usr/sbin/fdisk $DEVICE3
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Great here are all of your partitions:"
sleep 1
/usr/bin/echo ""
/usr/bin/lsblk
sleep 4

until [[ $g == 1 ]]
do
/usr/bin/echo ""
/usr/bin/echo "Which partition do you want to mark as a Physical Volume?"
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Choose from the following:"
/usr/bin/echo ""
/usr/bin/ls -1 /dev/?d??
/usr/bin/echo ""
sleep 1
read -p "Chosen partition:  " PARTITION3
/usr/bin/echo ""

if [[ $PARTITION3 == $(ls ${PARTITION3}) ]]
then
	/usr/bin/echo "You've chosen to mark $PARTITION3 as a Physical Volume!"
	/usr/sbin/pvcreate $PARTITION3
	/usr/bin/echo ""
	sleep 2
	(( g ++ ))
else
	/usr/bin/echo "Invalid Input"
fi
done

sleep 2
/usr/bin/echo "Let's Extend Volume Group $VGROUP to include $PARTITION3."
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Extending Volume Group $VGROUP to include Physical Volume $PARTITION3"
/usr/bin/echo ""
sleep 2
/usr/bin/echo "One moment please..."
/usr/bin/echo ""
sleep 1
/usr/sbin/vgextend $VGROUP $PARTITION3
sleep 1
/usr/bin/echo ""
sleep 2
/usr/bin/echo "Your Volume Group $VGROUP has been extended to include $PARTITION3!"
/usr/bin/echo ""
/usr/sbin/vgs
/usr/bin/echo ""
sleep 4

/usr/bin/echo "Great! Let's resize Logical Volume $LVOLUME2 with the following stats:

Name:		$LVOLUME2
Size: 		From 550M to 2G
VG: 		$VGROUP
TYPE: 		EXT4
Mounted to:	/sysadmin
"
sleep 4

/usr/sbin/lvresize -r -L 2G /dev/mapper/${VGROUP}-${LVOLUME2}
/usr/bin/echo ""
sleep 2
/usr/sbin/partprobe

/usr/bin/df -Th 
sleep 4
/usr/bin/echo "You've successfully extended the filesystem mounted at /sysadmin/ to 2G:

/dev/mapper/${VGROUP}-${LVOLUME2}
"
/usr/bin/echo ""

# Objective 28
#------------------------------------------------------------------------------
/usr/bin/echo "

Objective 28

"
sleep 5


/usr/bin/echo "Let's Extend the /yellowtail_docx filesystem to 1.7G.

This would be Logical Volume :

/dev/mapper/${VGROUP}-${LVOLUME1}
"
/usr/bin/echo ""
sleep 4
/usr/bin/echo "Here's a list of your available block devices:"
/usr/bin/echo ""
sleep 1
/usr/bin/lsblk
sleep 3
/usr/bin/echo "
"
until [[ $h == 1 ]]
do
/usr/bin/echo "Please type the FULL path of the block device you wish to partition.

Please choose from the following:
"
/usr/bin/ls -1 /dev/?d?

/usr/bin/echo "
"
read -p "Chosen Block Device (FULL PATH):  " DEVICE4

	if [[ $DEVICE4 == "$(ls ${DEVICE4})" ]]
	then
		/usr/bin/echo "Great, let's use # fdisk to partition $DEVICE4"
		sleep 1
		/usr/bin/echo ""
		/usr/bin/echo "Please set your partition as follows:

		-Size: +600M
		-Type: 8e (Linux LVM)"
		/usr/bin/echo ""
		sleep 5
		(( h ++ ))
	else
		/usr/bin/echo "Invalid input."
	fi
done

/usr/sbin/fdisk $DEVICE4
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Great here are all of your partitions:"
sleep 1
/usr/bin/echo ""
/usr/bin/lsblk
sleep 4

until [[ $i == 1 ]]
do
/usr/bin/echo ""
/usr/bin/echo "Which partition do you want to mark as a Physical Volume?"
/usr/bin/echo ""
/usr/bin/echo "Choose from the following:"
/usr/bin/echo ""
sleep 1
/usr/bin/ls -1 /dev/?d??
/usr/bin/echo ""
sleep 1
read -p "Chosen partition:  " PARTITION4
/usr/bin/echo ""

if [[ $PARTITION4 == $(ls ${PARTITION4}) ]]
then
	/usr/bin/echo "You've chosen to mark $PARTITION4 as a Physical Volume!"
	/usr/sbin/pvcreate $PARTITION4
	/usr/bin/echo ""
	sleep 2
	(( i ++ ))
else
	/usr/bin/echo "Invalid Input"
fi
done

sleep 2
/usr/bin/echo "Let's Extend Volume Group $VGROUP to include $PARTITION4."
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Extending Volume Group $VGROUP to include Physical Volume $PARTITION4"
/usr/bin/echo ""
sleep 2
/usr/bin/echo "One moment please..."
/usr/bin/echo ""
sleep 1
/usr/sbin/vgextend $VGROUP $PARTITION4
sleep 1
/usr/bin/echo ""
sleep 2
/usr/bin/echo "Your Volume Group $VGROUP has been extended to include $PARTITION4!"
/usr/bin/echo ""
/usr/sbin/vgs
/usr/bin/echo ""
sleep 4

/usr/bin/echo "Great! Let's resize Logical Volume $LVOLUME1 with the following stats:

Name:		$LVOLUME1
Size: 		From 1200M to 1.7G
VG: 		$VGROUP
TYPE: 		XFS
Mounted to:	/yellowtail_docx
"
sleep 4

/usr/sbin/lvresize -r -L "1.7"G /dev/mapper/${VGROUP}-${LVOLUME1}
/usr/bin/echo ""
sleep 2
/usr/sbin/partprobe

/usr/bin/df -Th 
sleep 4
/usr/bin/echo "You've successfully extended the filesystem mounted at /yellowtail_docx to 1.7G:

/dev/mapper/${VGROUP}-${LVOLUME1}
"
/usr/bin/echo ""

# Objective 29
#-------------------------------------------------------------------------------
/usr/bin/echo "

Objective 29

"
sleep 5


/usr/bin/echo "Let's Extend SWAP space by 650M

Let's also make sure not to alter the current partition where the swap is mounted!"
/usr/bin/echo ""
/usr/bin/echo "Firstly, let's see how much SWAP space we currently have:"
/usr/bin/echo ""
/usr/bin/free -m

SWAPBEFORE=$(free -m)

/usr/bin/echo ""
sleep 4
/usr/bin/echo "Here's a list of your available block devices:"
/usr/bin/echo ""
sleep 1
/usr/bin/lsblk
sleep 3
/usr/bin/echo "
"
until [[ $j == 1 ]]
do
/usr/bin/echo "Please type the FULL path of the block device you wish to partition.

Please choose from the following:
"
/usr/bin/ls -1 /dev/?d?

/usr/bin/echo "
"
read -p "Chosen Block Device (FULL PATH):  " DEVICE5

	if [[ $DEVICE5 == "$(ls ${DEVICE5})" ]]
	then
		/usr/bin/echo "Great, let's use # fdisk to partition $DEVICE5"
		sleep 1
		/usr/bin/echo ""
		/usr/bin/echo "Please set your partition as follows:

		-Size: +650M
		-Type: 8e (Linux LVM)"
		/usr/bin/echo ""
		sleep 5
		(( j ++ ))
	else
		/usr/bin/echo "Invalid input."
	fi
done

/usr/sbin/fdisk $DEVICE5
sleep 1
/usr/bin/echo ""
/usr/bin/echo "Great here are all of your partitions:"
sleep 1
/usr/bin/echo ""
/usr/bin/lsblk
sleep 4

until [[ $k == 1 ]]
do
/usr/bin/echo ""
/usr/bin/echo "Which partition do you want to mark as a Physical Volume?"
/usr/bin/echo ""
/usr/bin/echo "Choose from the following:"
/usr/bin/echo ""
sleep 1
/usr/bin/ls -1 /dev/?d??
/usr/bin/echo ""
sleep 1
read -p "Chosen partition:  " PARTITION5
/usr/bin/echo ""

if [[ $PARTITION5 == $(ls ${PARTITION5}) ]]
then
	/usr/bin/echo "You've chosen to mark $PARTITION5 as a Physical Volume!"
	/usr/sbin/pvcreate $PARTITION5
	/usr/bin/echo ""
	sleep 2
	(( k ++ ))
else
	/usr/bin/echo "Invalid Input"
fi
done

sleep 2
/usr/bin/echo "Let's add the Physical Volume $PARTITION5 to the $VGROUP Volume Group."
sleep 2
/usr/bin/echo ""
/usr/bin/echo "Extending Volume Group $VGROUP to include Physical Volume $PARTITION1"
/usr/bin/echo ""
sleep 2
/usr/bin/echo "One moment please..."
/usr/bin/echo ""
sleep 1
/usr/sbin/vgextend $VGROUP $PARTITION5
sleep 1
/usr/bin/echo ""
sleep 2
/usr/bin/echo "Your Volume Group $VGROUP has been created!"
/usr/bin/echo ""
/usr/sbin/vgs
/usr/bin/echo ""
sleep 4

read -p "Please type a name for your Logical Volume (no spaces):  " LVOLUME3
/usr/bin/echo ""
sleep 1
/usr/bin/echo "Great! Let's create a Logical Volume with the following:

Name:		$LVOLUME3
Size: 		650M
VG: 		$VGROUP
TYPE: 		SWAP
Mounted to:	SWAP
"
sleep 4

/usr/sbin/lvcreate -n $LVOLUME3 -L 650M $VGROUP
/usr/bin/echo ""
sleep 2
/usr/sbin/mkswap /dev/mapper/${VGROUP}-${LVOLUME3}
/usr/bin/echo ""
sleep 2
/usr/bin/echo "

BACKING UP /etc/fstab to /etc/fstab_bak/ directory:

"
/usr/bin/cp /etc/fstab /etc/fstab_bak/fstab-$(date +%H-%M_%m-%d-%y).bak
/usr/bin/ls /etc/fstab*
sleep 4

/usr/bin/echo "

UPDATING /etc/fstab

"

/usr/bin/echo "/dev/mapper/${VGROUP}-${LVOLUME3}   swap   swap   defaults,nofail   0 0" >> /etc/fstab
/usr/bin/echo ""
/usr/bin/cat /etc/fstab 
sleep 5
/usr/bin/echo ""

/usr/sbin/partprobe
sleep 2
/usr/bin/echo "Mounting all SWAP devices in /etc/fstab"

/usr/sbin/swapon -a
/usr/bin/echo ""

SWAPAFTER=$(free -m)

/usr/bin/echo "You've successfully Extended your SWAP space by +650M!"
/usr/bin/echo ""

sleep 1

/usr/bin/echo "Here's your SWAP space BEFORE:"
/usr/bin/echo ""
sleep 1
/usr/bin/echo "${SWAPBEFORE}"
/usr/bin/echo ""
sleep 3

/usr/bin/echo "Here's your SWAP space AFTER:"
/usr/bin/echo ""
sleep 1
/usr/bin/echo "${SWAPAFTER}"
/usr/bin/echo ""
sleep 5

# Objective 30
#----------------------------------------------------------------------------
/usr/bin/echo "

Objective 30

"
sleep 5

/usr/bin/echo "Let's archive the /etc/ directory with gzip compression and save it as 'comprehensive21.tar.gz' in the /sysadmin/ directory!"
/usr/bin/echo ""
sleep 3
/usr/bin/echo "One moment please..."
/usr/bin/echo ""
sleep 1
/usr/bin/tar -cvzf /sysadmin/comprehensive21.tar.gz /etc/
/usr/bin/echo ""
/usr/bin/echo "Great! Your archive of the /etc/ directory was successfully created.

Here is a confirmation:"
/usr/bin/echo ""
/usr/bin/echo "Contents of /sysadmin/ :"
/usr/bin/echo ""
sleep 1
/usr/bin/ls -l /sysadmin/
/usr/bin/echo ""
sleep 2
/usr/bin/file /sysadmin/comprehensive21.tar.gz
/usr/bin/echo ""
sleep 4


/usr/bin/echo "



CONGRATULATIONS!!!!!

YOU HAVE SUCCESSFULLY COMPLETED ALL 30 OBJECTIVES

NOW LET'S GET READY FOR CERT PREP!!



"
exec bash

# End of Script
