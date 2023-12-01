lsblk #To find the harddrive that needs to be partitioned
sudo fdisk /dev/sdb
# Enter the following and hit enter after each
g # create gpt table
n # create new partition
1 # partition number
2048 # first sector
+500M # last sector
# If it asks to remove a signature, say yes
t # change partition type
1 # to EFI system
n # new partition
2 # partition number
# Accept defaults by hitting enter on sectors
w
# Changes are now written to disk
# Formats and mounts partitions
sudo mkfs.fat -F 32 /dev/sdX1
sudo fatlabel /dev/sdX1 NIXBOOT
sudo mkfs.ext4 /dev/sdX2 -L NIXROOT
sudo mount /dev/disk/by-label/NIXROOT /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/NIXBOOT /mnt/boot
# Creates 2GB swap file
sudo dd if=/dev/zero of=/mnt/.swapfile bs=1024 count=2097152 (2GB size)
sudo chmod 600 /mnt/.swapfile
sudo mkswap /mnt/.swapfile
sudo swapon /mnt/.swapfile
# Connect to wifi
wpa_passphrase *wifiname* *wifipassword* | sudo tee /etc/wpa_supplicant.conf
ip link # Find name of interface that starts with w
sudo wpa_supplicant -B -c /etc/wpa_supplicant.conf -i *interface*
sudo systemctl restart wpa_supplicant 
# Create config files
sudo nixos-generate-config --root /mnt
cd /mnt/etc/nixos
sudo vim configuration.nix
# Make changes to config file
# Uncomment users, change username and add initialPassword=""
# Uncomment networking enabled
# Uncomment enviroment.systemPackages (for editor)
# Save changes
cd /mnt
sudo nixos-install
