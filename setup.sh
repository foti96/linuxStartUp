echo Username:

read userName

mkdir tmp

apt update -y
apt upgrade -y
apt install tilix git zsh curl gnome-tweaks gnome-shell-extensions chrome-gnome-shell nginx flatpak snapd pulseaudio -y
wget --directory-prefix=/tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./tmp/google-chrome-stable_current_amd64.deb
snap install --classic code slack google-cloud-sdk flutter
snap install snap-store spotify teams postman obs-studio vlc

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io -y
usermod -aG docker $userName
usermod -aG www-data $userName
curl -L "https://github.com/docker/compose/releases/download/1.27.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

curl -L "https://download.jetbrains.com/product?code=tb&latest&distribution=linux" --output toolbox.tar.gz
tar -xzf toolbox.tar.gz -C /opt
mv /opt/jetbrains-toolbox-* /opt/jetbrains-toolbox
/opt/jetbrains-toolbox/jetbrains-toolbox 


sudo su -c ssh-keygen $userName
sudo su -c cat ~/.ssh/id_rsa.pub $userName

while true; do
    read -p "Install NVM?" yn
    case $yn in
        [Yy]* ) curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o ./tmp/install_nvm.sh | bash ./tmp/install_nvm.sh break;;
        [Nn]* ) exit;;
        *) echo "Please select an Option? Yes or No.";;
    esac
done || exit 1

while true; do
    read -p "Install ZSH?" yn
    case $yn in
        [Yy]* ) sudo -l -U $userName sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" break;;
        [Nn]* ) exit;;
        *) echo "Please select an Option? Yes or No.";;
    esac
done || exit 1