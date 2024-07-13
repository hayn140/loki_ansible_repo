#!/bin/bash

/usr/bin/echo "We'll reset your vm to undo all changes made while doing the comprehensive Review."

/usr/bin/nmcli con show

read -p "Type the EXACT name of the static connection to remove:  " STATIC

/usr/bin/nmcli con del $STATIC

/usr/bin/hostnamectl set-hostname localhost.rhcsa.yellowtail.tech

/usr/sbin/userdel -rf eetienne

/usr/sbin/userdel -rf jwest

/usr/sbin/userdel -rf ppaul

/usr/sbin/userdel -rf mcosby

/usr/sbin/groupdel ytstudents

/usr/sbin/groupdel media

/usr/sbin/userdel -rf pcoelho

/usr/sbin/userdel -rf tfox

/usr/bin/rm -rvf /books

/usr/bin/rm -rvf /var/tmp/backup

/usr/bin/echo ""
/usr/bin/echo ""
/usr/bin/echo "Available Repos:
"

/usr/bin/ls -1 /etc/yum.repos.d/

/usr/bin/echo ""

read -p "Type the exact name of the repo to be deleted:  " REPO

/usr/bin/rm -rvf /etc/yum.repos.d/${REPO}

/usr/sbin/groupdel aws4jobs

/usr/sbin/userdel -rf leo

/usr/sbin/userdel -rf willis

/usr/sbin/userdel -rf lfjs

/usr/bin/rm -rvf /yellowtail

/usr/bin/rm -rvf /tmp/users
/usr/bin/echo "

"
/usr/bin/echo "Please delete the three entries you added to the /etc/fstab file for this review..."
/usr/bin/echo ""
sleep 1

/usr/bin/echo "Opening /etc/fstab in the vi text editor..."
/usr/bin/echo ""
sleep 5

/usr/bin/vi /etc/fstab

/usr/bin/umount -a

/usr/bin/mount -a

/usr/sbin/swapoff -a

/usr/sbin/swapon -a

sleep 3

/usr/sbin/partprobe
/usr/bin/systemctl daemon-reload
/usr/bin/echo ""
/usr/bin/echo "All three volumes are unmounted."

/usr/bin/lsblk

/usr/bin/echo ""
/usr/bin/echo "Let's start removing all of the logical volumes you created. 
	1. We'll first remove the Logical Volumes.
	2. Then we'll remove the Volume Groups
	3. Then we'll unmark the Physical Volumes
	4. Lastly, we'll delete the fdisk partitions.
	"
	sleep 5

/usr/bin/echo "Let's first remove all Logical Volumes you created for this review."
/usr/bin/echo ""

sleep 2


until [[ $LDONE == "y" ]]
do
	/usr/sbin/lvs
	/usr/bin/echo "
	"
	/usr/bin/echo "Type the exact name of the LOGICAL VOLUME you wish to remove:

			Example: /dev/mapper/vgreview-lvex23

			Type only: lvex23
			"
	/usr/bin/echo ""
	read -p "Logical Volume to remove:  " LVOLUME
	
	/usr/bin/echo ""
	read -p "Type the exact name of the VOLUME GROUP associated with this logical volume:  " VGROUP
	
	/usr/bin/echo ""
	/usr/sbin/lvremove /dev/mapper/${VGROUP}-${LVOLUME}
	
	/usr/bin/echo ""
	read -p "Are you done removing all LOGICAL VOLUMES you created for this exercise. (y/n)  " LDONE
	/usr/bin/echo ""
done

sleep 2

/usr/bin/echo "Let's remove all VOLUME GROUPS you created for this review."
/usr/bin/echo ""
sleep 2


until [[ $VDONE == "y" ]]
do
	/usr/sbin/vgs
	/usr/bin/echo "
	"
	/usr/bin/echo "Type the exact name of the VOLUME GROUP you wish to remove:  
	
                        Example: /dev/mapper/vgreview-lvex23

                        Type only: vgreview
			"
	/usr/bin/echo ""
	read -p "Volume Group to remove:  " VGROUP
	/usr/bin/echo ""

	/usr/sbin/vgremove $VGROUP
	/usr/bin/echo ""

	read -p "Are you done removing all VOLUME GROUPS you created for this review? (y/n)  " VDONE

done

sleep 2

/usr/bin/echo "Let's unmark all partitions you marked as PHYSICAL VOLUMES for this review."
/usr/bin/echo ""
sleep 2


until [[ $PDONE == "y" ]]
do
	/usr/sbin/pvs
	/usr/bin/echo "
	"
	/usr/bin/echo "Type the exact name of the PHYSICAL VOLUME partitions you wish to unmark:
			
			Example: /dev/sdb3

			Type only: sdb3
			"
	/usr/bin/echo ""
	read -p "Physical Volume to unmark: " PVOLUME
	/usr/bin/echo ""

	/usr/sbin/pvremove /dev/${PVOLUME}

	read -p "Are you done unmarking all PHYSICAL VOLUMES you created for this review? (y/n)  " PDONE

done

/usr/bin/echo ""

/usr/bin/echo "Lastly, I'll open the fdisk utility so that you can remove all relevant partitions."
sleep 2

/usr/bin/echo "Please type the FULL PATH to the disk you wish to use in the fdisk utility.

Please choose from one of the following:

"

/usr/bin/ls -1 /dev/*?d?

/usr/bin/echo ""

read -p "Disk to use with FDISK:  " FDISK

/usr/sbin/fdisk $FDISK

/usr/bin/rm -rf /yellowtail_docx

/usr/bin/rm -rf /sysadmin

/usr/bin/echo "Wiping all residual signatures from disk ${FDISK}"

/usr/sbin/wipefs -a $FDISK

/usr/bin/echo "

All 30 objectives from the comprehensive review have been undone!

"

sleep 3

exec bash

