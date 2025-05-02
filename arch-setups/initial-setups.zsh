# for bare-minimum dev stuffs
sudo pacman -S git zsh vim neovim inetutils zsh unzip

# (Optional) For enabling clipboard sharing between vim and KDE using wayland
sudo pacman -S wl-clipboard

# Setting up Korean fonts
sudo pacman -S noto-fonts-cjk
sudo pacman -S fctix5-hangul kcm-fcitx5 fctix5-im

# Need to update /etc/environment to add the following entry
# XMODIFIERS=@im=fcitx

# for printers
sudo pacman -S print-manager system-config-printer

# see https://wiki.archlinux.org/title/Avahi
# for automatic network discovery for printers and other devices
sudo pacman -S cups nss-mdns

# Start cups and aavahi-daemon.service
sudo systemctl enable cups.service
sudo systemctl start cups.service
sudo systemctl enable avahi-daemon.service
sudo systemctl start avahi-daemon.service

# Setting up  drkonqi-coredump-pickup.service 
sudo pacman -S drkonqi
systemctl enable drkonqi-coredump-processor@.service
systemctl --user enable --now drkonqi-coredump-launcher.socket

# Need for running AppImage files
sudo pacman -S fuse

# ghostty is provided, yay
sudo pacman -S ghostty

