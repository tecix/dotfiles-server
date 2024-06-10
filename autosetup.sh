#!/bin/bash
aptDepends=( 
               python3-pip 
               python3-dev  
               build-essential 
               cmake 
               git 
               unzip 
               pkg-config
               libopenblas-dev
               liblapack-dev  
               python-numpy
               python-scipy
               python-matplotlib
               python 
               aml  
               libhdf5-serial-dev 
               python-h5py  
               graphviz  
               python-opencv  
               python-sklearn  
               python3-sklearn
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
for i in `seq 3 -1 1` ; do echo -ne "$i\rThe setup will start in... " ; sleep 1 ; done


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

    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install -y "${aptDepends[@]}" 
    sudo pip3 install -y "${pipDepends[@]}"

  fi

elif [ "$os" = "Darwin" ]; then
  brew install git
  echo "This is an Apple Mac Machine"
else
  echo "Unsupported OS"
  exit 1
fi

echo "Congratulations, Git has now successfully been installed!"

# Grant execution permissions to the script
chmod +x autoinstall.sh

# Test the configuration
echo "Testing git configuration..."

if git --version >/dev/null 2>&1; then
  echo "Git is configured correctly."
else
  echo "Git configuration test failed. Please check the installation."
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


#Executing Install Dialog
dialogbox=(whiptail --separate-output --ok-button "Install" --title "Auto Setup Script" --checklist "\nPlease select required software(s):\n(Press 'Space' to Select/Deselect, 'Enter' to Install and 'Esc' to Cancel)" 30 80 20)
options=(1 "Visual Studio Code" off
	2 "SecLists" off
	3 "Python3, pip3, venv & iPython" off
	4 "Go" off
	5 "Rbenv" off
	6 "Amazon Corretto" off
	7 "Masscan" off
	8 "Chrome" off
	9 "NMAP" off
	10 "Drozer Framework" off
	11 "Jadx" off
	12 "httprobe" off
	13 "SQLMAP" off
	14 "Nuclei" off
	15 "i3 Window Manager" off
	16 "Aquatone" off
	17 "Skype" off
	18 "NodeJS" off
	19 "Sublime Text 3" off
	20 "Wireshark" off
	21 "Amass" off
	22 "Knockpy" off
	23 "Dirsearch" off
	24 "LinkFinder" off
	25 "Virtual Box" off)

selected=$("${dialogbox[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choices in $selected
do
	case $choices in
		1) 
		echo -e "${c}Installing Visual Studio Code"; $r
		checkInstalled snap installSnap
		sudo snap install code --classic
		echo -e "${c}Visual Studio Code Installed Successfully."; $r
		;;

		2)
		echo -e "${c}Downloading Daniel Miessler's SecLists in $HOME/tools"; $r
		cd && cd tools 
		git clone --depth 1 https://github.com/danielmiessler/SecLists.git
		;;

		3) 
		echo -e "${c}Installing Python3, Python3-pip and iPython"; $r
		installPython3
		sudo apt install -y python3-pip python3-setuptools
		sudo pip install ipython
		echo -e "${c}Installing development environment and virtualenv for Python"; $r
		sudo apt install -y build-essential libssl-dev libffi-dev python3-dev python3-venv
		;;

		4)
		installGo 
		;;

		5) 
		echo -e "${c}Installing & Setting up rbenv"; $r
		cd
		sudo rm -rf .rbenv/
		git clone https://github.com/rbenv/rbenv.git ~/.rbenv
		echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
		echo 'eval "$(rbenv init -)"' >> ~/.bashrc
		export PATH="$HOME/.rbenv/bin:$PATH"
		eval "$(rbenv init -)"
		source ~/.bashrc
		type rbenv
		git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
		echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
		source ~/.bashrc
		rbenv install 2.6.6
		rbenv install 3.0.1 #Installing required version of Ruby 
		rbenv global 3.0.1
		( set -x ; ruby -v )
		echo -e "${c}rbenv and defined ruby version setup Successfully."; $r
		;;

		6) 
		installCorretto
		;;

		7) 
		echo -e "${c}Installing Masscan in $HOME/tools/masscan"; $r
		cd && cd tools
		git clone --depth 1 https://github.com/robertdavidgraham/masscan
		cd masscan
		make
		sudo make install
		echo -e "${c}Masscan Installed Successfully."; $r
		;;

		8) 
		echo -e "${c}Installing Chrome"; $r
		cd
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo dpkg -i google-chrome-stable_current_amd64.deb
		sudo apt --fix-broken install -y
		rm -f google-chrome-stable_current_amd64.deb
		;;

		9) 
		echo -e "${c}Installing NMAP"; $r
		sudo apt install -y nmap
		;;

		10) 
		echo -e "${c}Installing Drozer Framework"; $r
		wget https://github.com/FSecureLABS/drozer/releases/download/2.4.4/drozer_2.4.4.deb 
		sudo dpkg -i drozer_2.4.4.deb
		sudo apt install -y -f
		rm -f drozer_2.4.4.deb
		echo -e "${c}Drozer Framework Installed Successfully."; $r
		;;

		11) 
		echo -e "${c}Installing JADX"; $r
		checkInstalled java installCorretto
		cd && cd tools
		git clone --depth 1 https://github.com/skylot/jadx.git
		cd jadx
		./gradlew dist
		echo -e "${c}JADX Installed Successfully."; $r
		;;

		12) 
		echo -e "${c}Installing httprobe"; $r
		checkInstalled go installGo
		go install github.com/tomnomnom/httprobe@latest
		;;

		13) 
		echo -e "${c}Downloading SQLMAP"; $r
		cd && cd tools
		git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
		echo -e "${c}SQLMAP Downloaded Successfully. Go to $HOME/tools/sqlmap-dev to run it."; $r
		;;

		14) 
		echo -e "${c}Installing Nuclei"; $r
		checkInstalled go installGo
		GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
		echo -e "${c}Nuclei Installed Successfully."; $r
		;;

		15) 
		echo -e "${c}Installing i3 Window Manager"; $r
		sudo apt install -y i3
		;;

		16) 
		echo -e "${c}Installing Aquatone"; $r
		cd && wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
		unzip aquatone_linux_amd64_1.7.0.zip -d /tmp
		sudo cp /tmp/aquatone /usr/local/bin
	    rm -f aquatone_linux_amd64_1.7.0.zip
		echo -e "${c}Aquatone Installed Successfully."; $r
		;;

		17) 
		echo -e "${c}Installing Skype"; $r
		wget https://go.skype.com/skypeforlinux-64.deb
		sudo apt install -y ./skypeforlinux-64.deb
		rm -f skypeforlinux-64.deb
		echo -e "${c}Skype Installed Successfully."; $r
		;;

		18) 
		echo -e "${c}Installing NodeJS (current)"; $r
		cd
		curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
		sudo apt install -y nodejs
		( set -x; nodejs -v )
		echo -e "${c}NodeJS Installed Successfully."; $r
		;;

		19) 
		echo -e "${c}Installing Sublime Text 3"; $r
		wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
		echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
		sudo apt update -y
		sudo apt install -y sublime-text
		;;

		20) 
		echo -e "${c}Installing Wireshark"; $r
		sudo apt install -y wireshark
		sudo dpkg-reconfigure wireshark-common 
		echo -e "${c}Adding user to wireshark group."; $r
		sudo usermod -aG wireshark $USER
		echo -e "${c}Wireshark Installed Successfully."; $r
		;;

		21)
		echo -e "${c}Installing Amass"; $r
		checkInstalled snap installSnap
		sudo snap install amass
		;;

		22)
		echo -e "${c}Installing Knockpy in $HOME/tools"; $r
		cd && cd tools
		sudo apt install -y python3-dnspython python3-setuptools python3-dev
		git clone --depth 1 https://github.com/guelfoweb/knock.git
		cd knock
		checkInstalled python3 installPython3
		sudo python3 setup.py install
		echo -e "${c}Knockpy Installed Successfully."; $r
		;;

		23)
 		echo -e "${c}Downloading Dirsearch in $HOME/tools"; $r
 		cd && cd tools
 		git clone --depth 1 https://github.com/maurosoria/dirsearch.git
 		echo -e "${c}Dirsearch Downloaded."; $r
 		;;

 		24)
		echo -e "${c}Installing LinkFinder in $HOME/tools"; $r
		cd && cd tools
		git clone --depth 1 https://github.com/GerbenJavado/LinkFinder.git
		cd LinkFinder
		checkInstalled python3 installPython3
		sudo apt install -y python3-pip
		sudo pip3 install argparse jsbeautifier
		sudo python3 setup.py install
		echo -e "${c}LinkFinder Installed Successfully."; $r
		;;

		25)
		echo -e "${c}Installing VirtualBox"; $r
		sudo apt install -y virtualbox
		;;	    
	esac
done

## Symlink dotfiles
stow tex -t ~
