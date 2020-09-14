apt update -y
apt upgrade -y
apt install tilix git zsh curl tweaks gnome-shell=extensions chrome-gnome-shell -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
snap install --classic code

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
usermod -aG docker $USER 
curl -L "https://github.com/docker/compose/releases/download/1.27.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

curl -L https://download.jetbrains.com/product?code=tb&latest&distribution=linux --output toolbox.tar.gz
tar -xzf toolbox.tar.gz -C /opt

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"