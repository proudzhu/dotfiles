#pacman
alias pacman='sudo pacman-color'
alias Syy='sudo pacman-color -Syy'
alias Syu='sudo pacman-color -Syu'
alias Syyu='sudo pacman-color -Syy && sudo pacman-color -Syu'
#ls
alias ls='ls --color=auto --group-directories-first'
alias l='ls -h --color=auto --group-directories-first'
alias ll='ls -hl --color=auto --group-directories-first'
alias la='ls -hA --color=auto --group-directories-first'
alias lla='ls -hlA --color=auto --group-directories-first'
#softwares
alias makepkg='makepkg -s -f'
alias grep='grep --color=auto'
#ping
alias pingv4='sudo ping -c 3 www.fudan.edu.cn'
alias pingv6='sudo ping6 -c 3 mirrors.ustc.edu.cn'
#mount
#alias mount-udisk='sudo mount -t vfat -o rw,utf8,umask=000 /dev/sdc1 /media/Udisk'
#aria2c
alias aria2c_proxy='aria2c --continue=true  --all-proxy=127.0.0.1:8087  --check-certificate=false'
#scrot
#alias scrot2net='scrot "%Y-%m-%d-%T_$wx$h.png" -d 5 -e "curl --proxy 127.0.0.1:8087 -F name=@$f http://img.vim-cn.com/"'
#paste to net
alias p2net='curl --proxy "127.0.0.1:8087" -F "vimcn=<-" http://p.vim-cn.com' 

#use vim as defaulted
alias vi='vim'

#rm
#alias rm='rm -i'

#create a playlist
alias creat_pl='find /media/WinD -maxdepth 4 -type f -iregex ".*\.\(aac\|flac\|mp3\|ogg\|wav\|m4a\|ape\)$" | sort > playlist'
alias play_music='mplayer -ao alsa -shuffle -playlist playlist'

