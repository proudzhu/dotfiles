# Path to your zsh configuration.
ZSH=$HOME/.zsh

#PATH
PATH="$HOME/bin:$PATH"

# perlbrew
# source $HOME/perl5/perlbrew/etc/bashrc

# add a function path
fpath=($ZSH/completions $fpath)

# Set the default editor, term
export EDITOR="vim"
#export TERM="rxvt-unicode-256color"
export TERM="xterm-256color"

# unzip workaround
export UNZIP="-O CP936"
export ZIPINFO="-O CP936"

# Load all of the config files in ~/.zsh that end in .zsh or .plugin.zsh
for config_file ($ZSH/lib/*.zsh) source $config_file
for plugin_file ($ZSH/plugins/*.plugin.zsh) source $plugin_file

# load syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# load history substring search
source $ZSH/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys
for keycode in '[' 'O'; do
    bindkey "^[${keycode}A" history-substring-search-up
    bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

# Load and run compinit
autoload -U age
autoload -U compinit
compinit -i

# Load the theme
ZSH_THEME="af-magic"
if [ ! "$ZSH_THEME" = ""  ]; then
  source "$ZSH/themes/$ZSH_THEME.zsh-theme"
fi

# Customize to your needs...
# z.sh
source $ZSH/z/z.sh

# use dircolors-solarized
eval `dircolors $HOME/.dir_colors`

# gcc colorful output
#export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

# go
export GOPATH="$HOME/go"
export PATH="$PATH:~/go/bin"

# use vimpager
#export PAGER=/usr/bin/vimpager
#alias less=$PAGER
#alias zless=$PAGER

# ccache
export PATH="/usr/lib/ccache/bin/:$PATH"

# perl6 panda
export PATH=$PATH:$HOME/.perl6/2015.06/bin

# luarocks
eval `luarocks path`
export PATH=$PATH:$HOME/.luarocks/bin

# for rust debug
export RUST_BACKTRACE=1

# for cabal
export PATH=$PATH:$HOME/.cabal/bin

# for python
export PATH=$PATH:$HOME/.local/bin

# for depot tools
export PATH=$PATH:/opt/depot_tools/

# android stdio
export GRADLE_USER_HOME="/media/WinD/.gradle"

# for android ndk
export PATH=$PATH:/opt/android-ndk/
