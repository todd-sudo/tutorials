ls -l /etc/profile.d/
chmod +x .xinitrc 
sudo pacman -S gdm
sudo systemctl -f enable gdm.service
systemctl -h
sudo pacman -S slim
sudo systemctl status sddm.service
sudo systemctl enable gdm

