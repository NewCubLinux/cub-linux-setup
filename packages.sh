sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y

sudo apt-get update -y
sudo apt-get upgrade -y

mkdir ~/bin

sudo apt-get install vim -y

sudo apt-get install git -y

sudo apt-get install locate -y

sudo apt-get install guake -y

sudo apt-get install php5 php5-mysql php5-dev -y

# The debconf-set-selections aims to provide a no password prompt install for mysql
# And the root user will have an empty password
echo 'mysql-server mysql-server/root_password password ' | sudo debconf-set-selections 
echo 'mysql-server mysql-server/root_password_again password ' | sudo debconf-set-selections
sudo apt-get install mysql-server mysql-client -y

sudo apt-get install apache2 -y

sudo apt-get install libgnomevfs2-extra gnome-commander -y

sudo apt-get install firefox -y

sudo apt-get install gsimplecal -y

sudo apt-get install nodejs -y

sudo apt-get install npm -y

sudo npm install -g grunt-cli

sudo apt-get install tint2 -y

sudo apt-get install ruby -y

sudo apt-get install gem -y

sudo apt-get install arandr -y

sudo apt-get install sublime-text-installer -y

