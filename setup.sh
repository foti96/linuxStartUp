apt update -y
apt upgrade -y
apt install tilix git zsh curl -y
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

curl -fsSL https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.18.7455.tar.gz
sudo tar -xzf jetbrains-toolbox-1.13.4801.tar.gz -C /opt

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"