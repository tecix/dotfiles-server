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

# Install git
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


