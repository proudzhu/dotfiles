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

function myip() {
   ETH_IP=$(/usr/sbin/ip addr show eth0 | awk '/inet/ { print $2 }')
   WLAN_IP=$(/usr/sbin/ip addr show wlan0 | awk '/inet/ { print $2 }')
   echo "eth0:\n${ETH_IP:-'Not connected'}"
   echo "wlan0:\n${WLAN_IP:-'Not connected'}"
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

mvgb () { # 文件名从 GB 转码，带确认{
    for i in $@; do
        new="`echo $i|iconv -f utf8 -t latin1|iconv -f gbk`"
        echo $new
        echo -n 'Sure? '
        read -q ans && mv -i $i $new
        echo
    done
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

function mypaclist() {
    pacman -Qei $(comm -23 <(pacman -Qtq|sort) <(pacman -Qqg base base-devel|sort)) |\
    awk ' BEGIN {FS=":"}/^Name/{printf("\033[1;36m%s\033[0m", $2)}/^Description/{print $2}'
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

#pacman log filter
pacman-log() {
    #if $1 is not given, use 100 instead
    tail -n ${1:-100} /var/log/pacman.log |\
    awk ' BEGIN {FS=" "}/\[ALPM\] upgraded/{printf("\033[1;32mUpgraded \033[0m \033[1;36m%s\033[0m %s%s%s\n", $5, $6, $7, $8)}
			/\[ALPM\] removed/{printf("\033[1;31mRemoved  \033[0m \033[1;36m%s\033[0m %s\n", $5, $6)}
			/\[ALPM\] installed/{printf("\033[1;37mInstall  \033[0m \033[1;36m%s\033[0m %s\n", $5, $6)}
			/\[ALPM\] downgraded/{printf("\033[1;33mDowngrade\033[0m \033[1;36m%s\033[0m %s%s%s\n", $5, $6, $7, $8)}
			/\[ALPM\] reinstalled/{printf("\033[1;34mReinstall\033[0m \033[1;36m%s\033[0m %s\n", $5, $6)} '
}

# pacman optional use sudo
pacman() {
    case $1 in
        -S | -D | -S[^sih]* | -R* | -U*)    /usr/bin/sudo /usr/bin/pacman "$@" ;;
        *)                                  /usr/bin/pacman "$@" ;;
    esac
}

#proxy
function proxy() {
     export http_proxy="127.0.0.1:8123"
     export https_proxy="127.0.0.1:8123"
     export ftp_proxy="127.0.0.1:8123"
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
#enable() {
#    sudo systemctl enable $1
#}
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
	scrot "%Y-%m-%d-%T_$wx$h.png" -d 5 -e 'curl -F "name=@$f" http://img.vim-cn.com/; mv $f ~/Pictures/capture/'
}

function img2net () {
    curl -F "name=@$f" http://img.vim-cn.com/
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
#
#

# A simple calc
calc(){ awk "BEGIN{ print $* }" ;}

# whoneeds only aur packages
aurneeds() {
    comm -12 <(pacman -Qqm | sort) <(whoneeds $1 | sed -e '1d; s|^\s*||' | sort)
}

#man2pdf
man2pdf() {
    if [[ -z $1 ]]; then
        echo "USAGE: man2pdf [manpage]"
    else
        if [[ `find /usr/share/man -name $1\* | wc -l` -gt 0 ]]; then
                out=/tmp/$1.pdf
                if [[ ! -e $out ]]; then
                        man -t $1 | ps2pdf - > $out
                fi
                if [[ -e $out ]]; then
                        /usr/bin/okular $out
                fi
        else
                echo "ERROR: manpage \"$1\" not found."
        fi
	fi
}

#edit config files
edit() {
    case $1 in
        'fstab')        sudo nano /etc/fstab  ;;
        'grub')         sudo nano /etc/default/grub ;;
        'mirror')       sudo nano /etc/pacman.d/mirrorlist ;;
        'pacman')       sudo nano /etc/pacman.conf ;;
        'goagent')      sudo nano /etc/goagent ;;
        'makepkg')      vi ~/.makepkg.conf ;;
        'zshrc')        vi ~/.zshrc ;;
        'cower')        vi ~/.config/cower/config ;;
        'alias')		vi ~/.zsh/plugins/alias.plugin.zsh ;;
        'fun')	        vi ~/.zsh/plugins/functions.plugin.zsh ;;
        'conky')        vi ~/.conkyrc ;;
		'vimrc')		vi ~/.vimrc ;;
        *)		vi $1 ;;
    esac
}
alias e='edit'

#cat and xclip
c2c() {
    cat $1 | xclip -selection c
}

#colorful pstree
cpstree() {
    pstree -U "$@" | sed '
        s/[-a-zA-Z]\+/\x1B[32m&\x1B[0m/g;
        s/[{}]/\x1B[31m&\x1B[0m/g;
        s/[─┬─├─└│]/\x1B[34m&\x1B[0m/g'
}

#colorful pactree
cpactree() {
    pactree "$@" | sed '
        s/[-a-zA-Z0-9]\+/\x1B[32m&\x1B[0m/g;
        s/provides/\x1B[31m&\x1B[0m/g;
        s/[─┬─├─└│]/\x1B[34m&\x1B[0m/g'
}

#gen random numbers between 0-99
getrand() {
    for i in {1..$1} ; do
        echo $(($RANDOM % 100))
    done
}

#md5sum for a input string
md5() {
    md5sum<<<$1 | cut -f1 -d' ';
}
