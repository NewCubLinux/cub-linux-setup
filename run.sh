SCRIPTFILE=$(readlink -f "$0")
SCRIPTDIR=$(dirname "$SCRIPTFILE")

sh $SCRIPTDIR/packages.sh

echo "Preparing composer command"
curl -sS https://getcomposer.org/installer | php -- --install-dir=$HOME/bin
mv $HOME/bin/composer.phar $HOME/bin/composer
chmod +x $HOME/bin/composer

echo "Initializing git bash prompt"
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt

echo "replacing default desktop"
sudo apt-get remove plank --purge -y
sudo apt-get remove nautilus --purge -y
sudo apt-get remove lxpanel --purge -y
sudo apt-get clean

echo "removing useless documents"
rmdir ~/Music
rmdir ~/Public
rmdir ~/Videos
rm -Rf ~/Templates


echo "setting up new environment"
# Nitrogen
mkdir ~/Pictures/wallpapers
cp $SCRIPTDIR/.config/wallpaper.png ~/Pictures/wallpapers
rm  ~/.config/nitrogen/*
cp -R $SCRIPTDIR/.config/nitrogen/* ~/.config/nitrogen
envsubst < ~/.config/nitrogen/bg-saved.cfg | tee ~/.config/nitrogen/bg-saved.cfg
envsubst < ~/.config/nitrogen/nitrogen.cfg | tee ~/.config/nitrogen/nitrogen.cfg
nitrogen --restore

# Tint2
sudo cp $SCRIPTDIR/.config/cardapio.desktop /usr/share/applications/cardapio.desktop
sudo cp $SCRIPTDIR/.config/magnifying-glass-icon.png /usr/share/applications/magnifying-glass-icon.png
mkdir ~/.config/tint2
cp $SCRIPTDIR/.config/tint2/tint2rc ~/.config/tint2/tint2rc

# ob autostart
cp $SCRIPTDIR/.config/ob-autostart/config ~/.config/ob-autostart/config

# Bash
cp $SCRIPTDIR/.custombashrc ~/.custombashrc
echo "source ~/.custombashrc" >> ~/.bashrc

echo "Updating mlocate database"
sudo updatedb


echo "Restarting now..."
sudo shutdown -r now 
