#pacman
alias pacman='sudo pacman'
alias Syy='sudo pacman -Syy'
alias Syu='sudo pacman -Syu'
alias Syyu='sudo pacman -Syyu'
#zsh config reload
#alias reload='. ~/.zshrc'
#pkgfile
alias pkgfile='pkgfile -v'
#ls
alias ls='ls --color=auto --group-directories-first'
alias l='ls -h --color=auto --group-directories-first'
alias ll='ls -hl --color=auto --group-directories-first'
alias la='ls -hA --color=auto --group-directories-first'
#cower
alias cower='cower --color=auto'
#makepks
alias makepkg='makepkg -f'
#grep
alias grep='grep -i --color=auto'
#dkms
alias dkms_vbox="sudo dkms install vboxhost/$(pacman -Q virtualbox|awk {'print $2'}|sed 's/\-.\+//') -k $(uname -rm|sed 's/\ /\//')"
#ping
alias pingv4='sudo ping -c 3 www.fudan.edu.cn'
alias pingv6='sudo ping6 -c 3 mirrors.ustc.edu.cn'
#aria2c
alias aria2c_proxy='aria2c --continue=true  --all-proxy=127.0.0.1:8087  --check-certificate=false'
#scrot
#alias scrot2net='scrot "%Y-%m-%d-%T_$wx$h.png" -d 5 -e "curl --proxy 127.0.0.1:8087 -F name=@$f http://img.vim-cn.com/"'
#paste to net
alias p2net='curl --proxy "127.0.0.1:8087" -F "vimcn=<-" http://p.vim-cn.com' 

#use vim as defaulted
alias vi='vim'

#create a playlist
alias creat_pl='find /media/WinD -maxdepth 4 -type f -iregex ".*\.\(aac\|flac\|mp3\|ogg\|wav\|m4a\|ape\)$" | sort > playlist'
alias play_music='mplayer -ao alsa -shuffle -playlist playlist'

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"
