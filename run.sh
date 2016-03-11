SCRIPTFILE=$(readlink -f "$0")
SCRIPTDIR=$(dirname "$SCRIPTFILE")


sudo apt-get update -y
sudo apt-get upgrade -y

mkdir ~/bin

echo "installing vim"
sudo apt-get install vim -y

echo "Installing git..."
sudo apt-get install git -y

echo "Installing locate..."
sudo apt-get install locate -y



echo "installing Guake Terminal"
sudo apt-get install guake -y

echo "Installing php5"
sudo apt-get install php5 php5-mysql php5-dev -y


echo "Preparing composer command"
curl -sS https://getcomposer.org/installer | php -- --install-dir=$HOME/bin
mv $HOME/bin/composer.phar $HOME/bin/composer
chmod +x $HOME/bin/composer



echo "Installing mysql"
echo 'mysql-server mysql-server/root_password password' | sudo debconf-set-selections 
echo 'mysql-server mysql-server/root_password_again password' | sudo debconf-set-selections
sudo apt-get install mysql-server mysql-client -y

echo "Installing apache2"
sudo apt-get install apache2 -y

echo "installing file system"
sudo apt-get install krusader -y

sudo apt-get install firefox -y

sudo apt-get install gsimplecal -y

echo "Initializing git bash prompt"
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt

echo "installing node"
sudo apt-get install nodejs -y

echo "installing npm"
sudo apt-get install npm -y

echo "installing grunt"
sudo npm install -g grunt-cli



echo "installing ruby"
sudo apt-get install ruby -y
echo "installing gem"
sudo apt-get install gem -y



echo "replacing default desktop"
sudo apt-get remove plank --purge
sudo apt-get remove nautilus --purge
sudo apt-get remove lxpanel --purge
sudo apt-get install tint2 --purge
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
rm -Rf ~/.config/nitrogen
cp -R $SCRIPTDIR/.config/nitrogen ~/.config/nitrogen

# Tint2
sudo cp $SCRIPTDIR/.config/cardapio.desktop /usr/share/applications/cardapio.desktop
sudo cp $SCRIPTDIR/.config/magnifying-glass-icon.png /usr/share/applications/magnifying-glass-icon.png
cp $SCRIPTDIR/.config/tint2/tint2rc ~/.config/tint2/tint2rc

# Bash
cp $SCRIPTDIR/.custombashrc ~/.custombashrc
echo "source ~/.custombashrc" > ~/.bashrc

echo "Updating mlocate database"
sudo updatedb


echo "Restarting now..."
sudo shutdown -r now 
