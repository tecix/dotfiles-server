autoload -U colors
autoload -U compinit
autoload -U edit-command-line

setopt COMPLETE_IN_WORD
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt NO_BEEP
setopt prompt_subst
setopt autopushd
setopt pushdminus
setopt pushdsilent
setopt pushdtohome

colors
compinit

DIRSTACKSIZE=8
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.history
MAILCHECK=0

EDITOR=vim

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ll="ls -alG"
alias ls="ls --color=auto --hyperlink=auto"
alias grep="grep --color=auto"
alias kdown="kitten transfer"
alias kup="kitten transfer -d upload"
alias t="tmux a"
# alias vim="nvim"
force_color_prompt=yes

PS1='%n@%m %~$ '

# Define functions for inserting commands
insert_systemctl_start() {
  LBUFFER+="systemctl start "
}

insert_systemctl_stop() {
  LBUFFER+="systemctl stop "
}

# Load functions as ZLE widgets
zle -N insert_systemctl_start
zle -N insert_systemctl_stop

# Bind functions to key combinations
bindkey '^[s' insert_systemctl_start
bindkey '^[t' insert_systemctl_stop

# Edit command line using Ctrl-x-e
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

eval "$(starship init zsh)"

