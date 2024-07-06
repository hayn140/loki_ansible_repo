#!/bin/bash
/usr/bin/echo "

"
/usr/bin/echo "Let's remove your logical volumes, volume groups, physical volumes, and then lastly your fdisk partitions."

sleep 5
/usr/bin/echo "
"
/usr/bin/echo "For the Volumes you wish to remove, please delete all entries you added to the /etc/fstab file..."
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
/usr/bin/echo "All volumes are unmounted."

/usr/bin/lsblk

/usr/bin/echo ""
/usr/bin/echo "Let's start removing all of the logical volumes you created. 
	1. We'll first remove the Logical Volumes.
	2. Then we'll remove the Volume Groups
	3. Then we'll unmark the Physical Volumes
	4. Lastly, we'll delete the fdisk partitions.
	"
	sleep 5

/usr/bin/echo "Let's first remove all Logical Volumes you created."
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
	read -p "Are you done removing all LOGICAL VOLUMES you wish to remove? (y/n)  " LDONE
	/usr/bin/echo ""
done

sleep 2

/usr/bin/echo "Let's remove all VOLUME GROUPS you wish to delete."
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

	read -p "Are you done removing all VOLUME GROUPS you wish to delete? (y/n)  " VDONE

done

sleep 2

/usr/bin/echo "Let's unmark all partitions you marked as PHYSICAL VOLUMES."
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

	read -p "Are you done unmarking all PHYSICAL VOLUMES? (y/n)  " PDONE

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

All desired Logical Volumes, Volume Groups, Physical Volumes and fdisk partitions have been removed!

"

sleep 3
