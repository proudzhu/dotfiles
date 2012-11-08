#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

echo -en "\033[1;36m"
echo "       /\                     _     _ _                   "
echo "      /  \      __ _ _ __ ___| |__ | (_)_ __  _   ___  __ "
echo "     /'   \    / _\` | '__/ __| '_ \| | | '_ \| | | \ \/ / "
echo "    /_- ~ -\  | (_| | | | (__| | | | | | | | | |_| |>  <  "
echo "   /        \  \__,_|_|  \___|_| |_|_|_|_| |_|\__,_/_/\_\ "
echo "  /  _- - _ '\                                            "
echo " /_-'      '-_\                                           "
echo -en "\033[0m\n"

 
 if ! systemd-notify --booted; then # not using systemd
  start() {
    sudo rc.d start $1
  }
 restart() {
    sudo rc.d restart $1
  }
  stop() {
    sudo rc.d stop $1
  }
else
  start() {
    sudo systemctl start $1
  }
  restart() {
    sudo systemctl restart $1
  }
  stop() {
    sudo systemctl stop $1
  }
  enable() {
    sudo systemctl enable $1
  }
  status() {
    sudo systemctl status $1
  }
  disable() {
    sudo systemctl disable $1
  }
fi

#Some useful scripts
source ~/Scripts/functions

#Command Not Found
source /usr/share/doc/pkgfile/command-not-found.bash

# Colored manual pages
# @see http://www.tuxarena.com/?p=508
# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[0m' # begin underline
export LESS="-R"


#Personal Aliases
source ~/Scripts/alias

#ipv6_proxy
#export http_proxy='127.0.0.1:8087'
#export https_proxy='127.0.0.1:8087'
