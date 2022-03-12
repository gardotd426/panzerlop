
sudo apt install macchanger

# Get list of network interfaces. Excludes loopback and virtual machine interfaces.
interfaces=$(ls /sys/class/net | grep -v 'lo' | grep -v 'tun0' | grep -v "virbr")

# Spoof the MAC address of each.
for i in ${interfaces}
do
  macchanger -e $i >/dev/null # Hide the output so it can't be discovered with systemd logs.
done
