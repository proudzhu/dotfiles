#pacman
alias Syy='sudo pacman -Syy'
alias Syu='sudo pacman -Syu'
alias Syyu='sudo pacman -Syyu'

#pkgfile
alias pkgfile='pkgfile -v'

#ls
alias ls='ls --escape -h --color=auto --group-directories-first'
alias ll='ls --escape -hl --color=auto --group-directories-first'
alias la='ls --escape -hlA --color=auto --group-directories-first'

#makepks
alias makepkg='makepkg -f'

# advcp
#alias cp='acp -g'

#grep
alias grep='grep -i --color=auto'

#dkms
#alias dkms_vbox="sudo dkms install vboxhost/$(pacman -Q virtualbox|awk {'print $2'}|sed 's/\-.\+//') -k $(uname -rm|sed 's/\ /\//')"

#ping
alias pingv4='sudo ping -c 3 www.baidu.com'
alias pingv6='sudo ping6 -c 3 ipv6.google.com'

#aria2c
alias aria2c_proxy='aria2c --continue=true  --all-proxy=127.0.0.1:8087  --check-certificate=false'

#paste to net
alias p2net='curl -F "vimcn=<-" http://p.vim-cn.com' 

#use vim as defaulted
alias vi='vim'
alias vim='nvim'

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

# cpanm
alias cpanm2='cpanm --mirror http://fs.fudan.edu.cn/mirror/CPAN --mirror-only'

# ydcv with proxy
alias ydcv_proxy='ydcv3 --proxy=127.0.0.1:8087'

# suffix alias
for i in avi rmvb wmv mp4 mkv; alias -s $i=mplayer

# archnews
alias archnews='archnews.py|head -n 10'

# git
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# man
alias woman='man'
alias girl='man'

# ycm_config_gen
alias ycm_config_gen="$HOME/workspace/YCM-Generator/config_gen.py ."

# get system install time
alias get_installation_time='echo $(grep -c "full system upgrade" /var/log/pacman.log) upgrades since $(head -n1 /var/log/pacman.log | cut -d " " -f 1,2)'

# bilidan
alias bilidan="bilidan --cookie 'DedeUserID=457115; DedeUserID__ckMd5=6364b2811eeacc02; SESSDATA=ffb9069c%2C1447552556%2Cddbad396'"

# proxychains
alias proxychains="proxychains -f $HOME/.config/proxychains/proxychains.conf"

# cmake clang
alias clangmake="cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_USER_MAKE_RULES_OVERRIDE=~/ClangOverrides.txt"
