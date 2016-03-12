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

echo "Installing mysql"
# The debconf-set-selections aims to provide a no password prompt install for mysql
# And the root user will have an empty password
echo 'mysql-server mysql-server/root_password password ' | sudo debconf-set-selections 
echo 'mysql-server mysql-server/root_password_again password ' | sudo debconf-set-selections
sudo apt-get install mysql-server mysql-client -y

echo "Installing apache2"
sudo apt-get install apache2 -y

echo "installing file system"
sudo apt-get install krusader -y

sudo apt-get install firefox -y

sudo apt-get install gsimplecal -y

echo "installing node"
sudo apt-get install nodejs -y

echo "installing npm"
sudo apt-get install npm -y

echo "installing grunt"
sudo npm install -g grunt-cli

echo "installing tint2"
sudo apt-get install tint2 -y

echo "installing ruby"
sudo apt-get install ruby -y

echo "installing gem"
sudo apt-get install gem -y

echo "installing arandr"
sudo apt-get install arandr -y

