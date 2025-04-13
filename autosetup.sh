#!/bin/bash
DebianAptDepends=( 
               python3-pip 
	       stow
               git 
               unzip 
	       fd-find
               ripgrep
               kitty-terminfo
           )

pipDepends=(
               # matplotlib
               # pydot-ng
               # tensorflow
               # keras
               # scikit-learn
           )

# Determine OS name
os=$(uname)

#Display Banner
if [[ ! -z $(which figlet) ]]; then
    figlet AutoSetup
    echo -e "${y} - By Shubham Pathak"
else 
echo -e "\n\n\n\n
    _         _       ____       _
   / \  _   _| |_ ___/ ___|  ___| |_ _   _ _ __
  / _ \| | | | __/ _ \___ \ / _ \ __| | | | '_ |
 / ___ \ |_| | || (_) |__) |  __/ |_| |_| | |_) |
/_/   \_\__,_|\__\___/____/ \___|\__|\__,_| .__/
                                          |_| 
						  - By Chi-Thien Tran"
fi

# 3 seconds wait time to start the setup
# for i in `seq 3 -1 1` ; do echo -ne "$i\rThe setup will start in... " ; sleep 1 ; done


if [ "$os" = "Linux" ]; then
echo "This is a Linux Machine"
  if [[ -f /etc/redhat-release ]]; then
    pkg_manager=yum
  elif [[ -f /etc/debian_version ]]; then
    pkg_manager=apt
  fi

  if [ $pkg_manager = "yum" ]; then
    sudo yum install git -y

  elif [ $pkg_manager = "apt" ]; then
    echo "Hello Linux user"
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install -y "${DebianAptDepends[@]}" 
    sudo pip3 install -y "${pipDepends[@]}"
    ln -s `which fdfind` /usr/local/bin/fd

  fi

elif [ "$os" = "Darwin" ]; then
  brew install git
  echo "This is an Apple Mac Machine"
else
  echo "Unsupported OS"
  exit 1
fi


#Setting up Git
read -p "${y}Do you want to setup Git global config? (y/n): " -r; $r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo -e "${c}Setting up global git config at ~/.gitconfig"; $r
	git config --global color.ui true
	read -p "Enter Your Full Name: " name
	read -p "Enter Your Email: " email
	git config --global user.name "$name"
	git config --global user.email "$email"
	echo -e "${c}Git Setup Successfully!"; $r
else
	echo -e "${c}Skipping!"; $r && :
fi


## Symlink dotfiles
stow tex -t ~
