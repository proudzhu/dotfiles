#pacman
alias pacman='sudo pacman'
alias Syy='sudo pacman -Syy'
alias Syu='sudo pacman -Syu'
alias Syyu='sudo pacman -Syyu'

#pkgfile
alias pkgfile='pkgfile -v'

#ls
alias ls='ls --color=auto --group-directories-first'
alias l='ls -h --color=auto --group-directories-first'
alias ll='ls -hl --color=auto --group-directories-first'
alias la='ls -hA --color=auto --group-directories-first'

#makepks
alias makepkg='makepkg -f'

#grep
alias grep='grep -i --color=auto'

#dkms
#alias dkms_vbox="sudo dkms install vboxhost/$(pacman -Q virtualbox|awk {'print $2'}|sed 's/\-.\+//') -k $(uname -rm|sed 's/\ /\//')"

#ping
alias pingv4='sudo ping -c 3 www.fudan.edu.cn'
alias pingv6='sudo ping6 -c 3 mirrors.ustc.edu.cn'

#aria2c
alias aria2c_proxy='aria2c --continue=true  --all-proxy=127.0.0.1:8087  --check-certificate=false'

#paste to net
alias p2net='curl --proxy "127.0.0.1:8087" -F "vimcn=<-" http://p.vim-cn.com' 

#use vim as defaulted
alias vi='vim'

#create a playlist
alias creat_pl='find /media/WinD -maxdepth 4 -type f -iregex ".*\.\(aac\|flac\|mp3\|ogg\|wav\|m4a\|ape\)$" | sort > playlist'
alias play_music='mplayer -ao alsa -shuffle -playlist playlist'

#reload .zshrc
alias reload='. ~/.zshrc && echo "ZSH config reloaded from ~/.zshrc" '
alias zshrc='vim ~/.zshrc && reload'

#change mirrors
alias getmirror='awk "/^Server/" /etc/pacman.d/mirrorlist'
alias ustc2tuna='sudo sed -i -re "s|^Server|#Server|; s|^#Server = http://mirrors.tuna.tsinghua.edu.cn|Server = http://mirrors.tuna.tsinghua.edu.cn|" /etc/pacman.d/mirrorlist'
alias tuna2ustc='sudo sed -i -re "s|^Server|#Server|; s|^#Server = http://mirrors.ustc.edu.cn|Server = http://mirrors.ustc.edu.cn|" /etc/pacman.d/mirrorlist'

# display the ten newest files
alias lsnew="ls -rl *(D.om[1,10])"
# display the ten oldest files
alias lsold="ls -rtlh *(D.om[1,10])"
# display the ten smallest files
alias lssmall="ls -Srl *(.oL[1,10])"
