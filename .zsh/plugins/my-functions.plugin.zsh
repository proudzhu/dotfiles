# Set colors for man pages
man() {
	env \
	LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

##############################################################
#clock - a little clock that appeares in the terminal window.
#Usage: clock.
##############################################################
clock () {
	while true;
	do clear;
	echo "===========";
	date +"%r";
	echo "===========";
	sleep 1;
	done
}

##################################
# easy compress - archive wrapper
###################################
compress () {
    if [ -n "$1" ] ; then
        FILE=$1
        case $FILE in
        *.tar) shift && tar cf $FILE $* ;;
        *.tar.bz2) shift && tar cjf $FILE $* ;;
        *.tar.gz) shift && tar czf $FILE $* ;;
        *.tgz) shift && tar czf $FILE $* ;;
        *.zip) shift && zip $FILE $* ;;
        *.rar) shift && rar $FILE $* ;;
        esac
    else
        echo "usage: compress <foo.tar.gz> ./foo ./bar"
    fi
}

#-----------------------------------
# File & strings related functions:
#-----------------------------------

# Find a file with a pattern in name:
function ff() { 
	find . -type f -iname '*'$*'*' -ls;
}
# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { 
	find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ;
}
# find pattern in a set of filesand highlight them:
function fstr() {
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
    Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
            i) case="-i " ;;
            *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    local SMSO=$(tput smso)
    local RMSO=$(tput rmso)
    find . -type f -name "${2:-*}" -print0 |
    xargs -0 grep -sn ${case} "$1" 2>&- | \
    sed "s/$1/${SMSO}\0${RMSO}/gI" | more
}

function cuttail() { # Cut last n lines in file, 10 by default.
    nlines=${2:-10}
    sed -n -e :a -e "1,${nlines}!{P;N;D;};N;ba" $1
}

function lowercase() {  # move filenames to lowercase
    for file ; do
        filename=${file##*/}
        case "$filename" in
            */*) dirname==${file%/*} ;;
            *) dirname=.;;
        esac
        nf=$(echo $filename | tr A-Z a-z)
        newname="${dirname}/${nf}"
        if [ "$nf" != "$filename" ]; then
            mv "$file" "$newname"
            echo "lowercase: $file --> $newname"
        else
            echo "lowercase: $file not changed."
        fi
    done
}

function swap() {        # swap 2 filenames around
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function cp_p() {
   set -e
   strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
      | awk '{
        count += $NF
            if (count % 10 == 0) {
               percent = count / total_size * 100
               printf "%3d%% [", percent
               for (i=0;i<=percent;i++)
                  printf "="
               printf ">"
               for (i=percent;i<100;i++)
                  printf " "
               printf "]\r"
            }
         }
         END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

#copy and go to dir
function cpg () {
  if [ -d "$2" ];then
    cp $1 $2;cd $2
  else
    cp $1 $2
  fi
}

#move and go to dir
mvg () {
  if [ -d "$2" ];then
    mv $1 $2;cd $2
  else
    mv $1 $2
  fi
}

# finds directory sizes and lists them for the current directory
function dirsize () {
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
    egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list
}

#-----------------------------------
# Process/system related functions:
#-----------------------------------
function my_ps() {
	ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ;
}

function pp() {
	my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ;
}

# This function is roughly the same as 'killall' on linux
# but has no equivalent (that I know of) on Solaris
function killps() {  # kill by process name
    local pid pname sig="-TERM"   # default signal
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(my_ps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} ) ; do
        pname=$(my_ps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
        then kill $sig $pid
        fi
    done
}

#function myip() # get IP adresses
#{
# myip=`elinks -dump http://checkip.dyndns.org:8245/`
# echo "${myip}"
#}
function myip() {
   MY_IP=$(/usr/sbin/ip addr show eth0 | awk '/inet/ { print $2 } ' | 
        sed -e s/addr://)
   echo ${MY_IP:-"Not connected"}
}

function ii() {  # get current host related info
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    my_ip 2>&- ;
    echo -e "\n${RED}Local IP Address :$NC" ; myip
    echo
}

##############################################
# Pacman Tips
##############################################
#Removing orphaned packages
function  orphans()  {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
  else
    sudo pacman -Rs $(pacman -Qdtq)
  fi
}

function paclist() {
  sudo pacman -Qei $(pacman -Qu|cut -d" " -f 1)|awk ' BEGIN {FS=":"}/^Name/{printf("\033[1;36m%s\033[1;37m", $2)}/^Description/{print $2}'
}

function pacdisowned() {
  tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
  db=$tmp/db
  fs=$tmp/fs

  mkdir "$tmp"
  trap  'rm -rf "$tmp"' EXIT

  pacman -Qlq | sort -u > "$db"

  find /bin /etc /lib /sbin /usr \
      ! -name lost+found \
        \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  comm -23 "$fs" "$db"
}

#proxy
function proxy() {
     export http_proxy="127.0.0.1:8087"
     export https_proxy="127.0.0.1:8087"
     export ftp_proxy="127.0.0.1:8087"
     export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
     echo -e "\nProxy environment variable set."
 }
 function proxyoff() {
     unset HTTP_PROXY
     unset http_proxy
     unset HTTPS_PROXY
     unset https_proxy
     unset FTP_PROXY
     unset ftp_proxy
     echo -e "\nProxy environment variable removed."
 } 


##############################################
# Systemd Tips
##############################################
#systemd
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

##############################################
# Scrot Tips
##############################################
# Scrot in 5s, save it in ~/Pictures/capture/ and paste it on img.vim-cn.com
function scrot2net () {
	scrot "%Y-%m-%d-%T_$wx$h.png" -d 5 -e 'curl --proxy "127.0.0.1:8087" -F "name=@$f" http://img.vim-cn.com/; mv $f ~/Pictures/capture/'
}

# Scort in 5s, save it in ~/Pictures/capture/
function scrot_5 () {
	scrot "%Y-%m-%d-%T_$wx$h.png" -d 5 -e 'mv $f ~/Pictures/capture/' 
}  

##空行(光标在行首)补全 "cd " {{{
user-complete() {
    case $BUFFER in
        "" )                       # 空行填入 "cd "
            BUFFER="cd "
            zle end-of-line
            zle expand-or-complete
            ;;
        cd\ \ * )                  # TAB + 空格 替换为 "cd ~"
            BUFFER=${BUFFER/\ \ /\ ~}
            zle end-of-line
            zle expand-or-complete
            ;;
        " " )
            BUFFER="!?"
            zle end-of-line
            ;;
        "cd --" )                  # "cd --" 替换为 "cd +"
            BUFFER="cd +"
            zle end-of-line
            zle expand-or-complete
            ;;
        "cd +-" )                  # "cd +-" 替换为 "cd -"
            BUFFER="cd -"
            zle end-of-line
            zle expand-or-complete
            ;;
        * )
            zle expand-or-complete
            ;;
    esac
}
zle -N user-complete
bindkey "\t" user-complete

user-ret() {
    if [[ $BUFFER = "" ]] ;then
        BUFFER="ls"
        zle end-of-line
        zle accept-line
    elif [[ $BUFFER =~ "^cd\ \.\.\.+$" ]] ;then
          BUFFER=${${BUFFER//\./\.\.\/}/\.\.\//}
        zle end-of-line            
        zle accept-line
    else
        zle accept-line
    fi
}
zle -N user-ret
bindkey "\r" user-ret

#历史命令 top10
alias top10='print -l  ${(o)history%% *} | uniq -c | sort -nr | head -n 10'
#}}}

##在命令前插入 sudo {{{
#定义功能 
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line                 #光标移动到行末
}
zle -N sudo-command-line
#定义快捷键为： [Esc] [Esc]
bindkey "\e\e" sudo-command-line
#}}}
