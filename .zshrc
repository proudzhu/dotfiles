# Path to your zsh configuration.
ZSH=$HOME/.zsh

#PATH
PATH=$HOME/bin:$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin

# perlbrew
# source $HOME/perl5/perlbrew/etc/bashrc

# add a function path
fpath=($ZSH/completions $fpath)

# Set the default editor, term
export EDITOR="vim"
#export TERM="rxvt-unicode-256color"
export TERM="xterm"

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
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
