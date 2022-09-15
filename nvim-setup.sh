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
install-prog ripgrep
install-prog fd-find
