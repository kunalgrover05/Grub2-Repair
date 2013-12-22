echo "grub repair by kunal"
sudo blkid | grep ext4
echo "select ubuntu partition(eg sda2)"
read input
echo "you selected $input. Select y to continue"
read choice
if [ $choice = 'y' ]; then
	sudo mount /dev/$input /mnt
	sudo mount --bind /dev /mnt/dev && sudo mount --bind /dev/pts /mnt/dev/pts && sudo mount --bind /proc /mnt/proc && sudo mount --bind /sys /mnt/sys
	sudo chroot /mnt /bin/bash -c " grub-install /dev/${input:0:3} ;grub-install --recheck /dev/${input:0:3}; update-grub"
	sudo umount /mnt/dev && sudo umount /mnt/dev/pts && sudo umount /mnt/proc && sudo umount /mnt/sys && sudo umount /mnt
fi
