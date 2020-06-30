# visudo
# useradd -m -G wheel -s /bin/bash alehatsman
# passwd ale

# Arch.exe config --default-user ale

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys
# sudo pacman -Syyu

if [[ -f "pacman-static" ]]; then
	wget https://pkgbuild.com/~eschwartz/repo/x86_64-extracted/pacman-static
fi

sudo chmod +x pacman-static
sudo ./pacman-static --noconfirm -Syyu
sudo ./pacman-static -Sy archlinux-keyring && ./pacman-static -Syyu

sudo pacman -Syy base-devel openssl python ansible glibc
