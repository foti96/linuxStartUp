apt update
apt upgrade
apt install tilix git zsh curl -y
snap install --classic code
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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
TOOLBOX_URL=$(curl --silent 'https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release' \
    -H 'Origin: https://www.jetbrains.com' \
    -H 'Accept-Encoding: gzip, deflate, br' \
    -H 'Accept-Language: en-US,en;q=0.8' \
    -H 'Accept: application/json, text/javascript, */*; q=0.01' \
    -H 'Referer: https://www.jetbrains.com/toolbox/download/' \
    -H 'Connection: keep-alive' \
    -H 'DNT: 1' \
    --compressed \
  | grep -Po '"linux":.*?[^\\]",' \
  | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')

install -d ${HOME}/bin
curl -sL ${TOOLBOX_URL} | tar xvz --directory=${HOME}/bin --strip-components=1

# intial setup
$(jetbrains-toolbox)