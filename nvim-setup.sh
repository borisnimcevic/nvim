#!/bin/bash

# root is needed for this script
if [ $USER != "root" ]; then
	echo "You need to run this script as a root user."
	echo "Try: sudo ./nvim-setup.sh"
	exit
fi

# install prerequisites
function install-prog {
  # We don't care about the output of this command so we do both, stdout and
  # stderr, to the void (/dev/null). Why would we run a command, but then 
  # disregard all the results? Well look at the if statement.
  which $1 &> /dev/null

  # "echo $?" returns the result of the previous command. So if the program was
  # installed "which" command would return 0. If the program doesn't exist the
  # return is something else then 0 and we have to install it.
  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install-prog curl
install-prog libfuse2
install-prog build-essential
# install-prog clangd
# install-prog figlet
# install-prog git
# install-prog lolcat
# install-prog nodejs
# install-prog npm
# install-prog python3.9
# install-prog python3-pip

# pip3 install neovim

# download latest stable neovim
echo "Downloading nvim..." 
curl -LOf https://github.com/neovim/neovim/releases/download/stable/nvim.appimage

# check if ~/.local/bin/ already exist
BIN_DIR="/home/$SUDO_USER/.local/bin"
if [ -d "$BIN_DIR" ]; then
	echo "$BIN_DIR exist. Great!" 
else
	echo "$BIN_DIR does not exits. Let's make it." 
	mkdir -pv "$BIN_DIR"
	echo "$BIN_DIR is now created." 
fi

# TODO: make all of these in a nicer function so the code is not repeating 
# add PATH
BASHRC_DIR="/home/$SUDO_USER/.bashrc"
grep $BIN_DIR $BASHRC_DIR &> /dev/null
if [ $? -ne 0 ]; then
  echo "path to $BIN_DIR not yet added in the bashrc"
  echo "adding it now.."
  echo "export PATH=\"$PATH:$BIN_DIR\"" >> $BASHRC_DIR
else
  echo "$BIN_DIR is already in the path in bashrc"
fi

ZSHRC_DIR="/home/$SUDO_USER/.zshrc"
grep $BIN_DIR $ZSHRC_DIR &> /dev/null
if [ $? -ne 0 ]; then
  echo "path to $BIN_DIR not yet added in the zshrc"
  echo "adding it now.."
  echo "export PATH=\"$PATH:$BIN_DIR\"" >> $ZSHRC_DIR
else
  echo "$BIN_DIR is already in the path in zshrc"
fi

# set nvim as the main EDITOR
grep "export EDITOR=\"nvim\"" $BASHRC_DIR &> /dev/null
if [ $? -ne 0 ]; then
  echo "settign nvim as the main EDITOR in bashrc"
  echo "export EDITOR=\"nvim\"" >> $BASHRC_DIR
else
  echo "nvim alrady set as the main EDITOR in bashrc"
fi

grep "export EDITOR=\"nvim\"" $ZSHRC_DIR &> /dev/null
if [ $? -ne 0 ]; then
  echo "settign nvim as the main EDITOR in zshrc"
  echo "export EDITOR=\"nvim\"" >> $ZSHRC_DIR
else
  echo "nvim alrady set as the main EDITOR in zshrc"
fi

# set aliases
grep "alias v=\"nvim\"" $BASHRC_DIR &> /dev/null
if [ $? -ne 0 ]; then
  echo "setting nvim aliases in .bashrc"
  echo "alias v=\"nvim\"" >> $BASHRC_DIR
else
  echo "aliases alrady set in .basrhc"
fi

grep "alias v=\"nvim\"" $ZSHRC_DIR &> /dev/null
if [ $? -ne 0 ]; then
  echo "setting nvim aliases in .zshrc"
  echo "alias v=\"nvim\"" >> $ZSHRC_DIR
else
  echo "aliases alrady set in .zshrc"
fi

# make it executable with 'nvim'
# sudo chmod +x nvim.appimage
# sudo mv nvim.appimage $BIN_DIR/nvim
chmod +x nvim.appimage
mv nvim.appimage $BIN_DIR/nvim
echo "moved nvim to $BIN_DIR"

# symlink nvim configuration
destination="/home/$SUDO_USER/.config/nvim"
dateString=$(date +%Y-%m-%d-%H%M)

if [ -d "${destination}" ]; then
  # The configuration already exist, we should change the name and back it up
  echo "Backing up existing dir: ${destination}"
  mv ${destination}{,.${dateString}}
fi

echo "Creating new symlink: ${destination}"
echo "Running ---> ln -s $PWD ${destinatio}"
ln -s $PWD ${destination}

# get packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 /home/$SUDO_USER/.local/share/nvim/site/pack/packer/start/packer.nvim

# install packer plugins
nvim --headless +"PackerInstall" +qa

echo "nvim setup done!!!"
