# Path to your zsh configuration.
ZSH=$HOME/.zsh/

#PATH
PATH=$PATH:$HOME/bin:/usr/bin/vendor_perl/:$(ruby -rubygems -e "puts Gem.user_dir")/bin

# add a function path
fpath=($ZSH/completions $fpath)

# Set the default editor, term
export EDITOR="vim"
export TERM="konsole-256color"

# Load all of the config files in ~/.zsh that end in .zsh or .plugin.zsh
for config_file ($ZSH/lib/*.zsh) source $config_file
for plugin_file ($ZSH/plugins/*.plugin.zsh) source $plugin_file

# load syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# load history substring search
source $ZSH/zsh-history-substring-search/zsh-history-substring-search.zsh

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
