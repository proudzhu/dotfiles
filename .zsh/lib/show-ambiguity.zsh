zmodload zsh/complist
autoload -U compinit
compinit -u
zstyle ':completion:*' show-ambiguity true
