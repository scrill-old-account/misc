### My minimal Zsh config
### https://github.com/scrill

### Environment
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
PATH=/usr/local/sbin:/usr/sbin:~/.bin:${PATH}

### Modules
autoload -U compinit colors promptinit
compinit
colors
promptinit

### Options
setopt hist_ignore_all_dups # turn off duplicates in history
setopt no_auto_menu         # turn off items substitution
setopt nohashcmds           # turn off hashing command
unsetopt equals

### Prompt
if [[ $(uname -r) == *gentoo* ]]; then
  prompt gentoo
else
  if [[ $(whoami) == 'root' ]]; then
    PS1="%B%F%{$fg[red]%}%m%k %B%F%{$fg[blue]%}%1~ %# %b%f%k"
  else
    PS1="%B%F%{$fg[green]%}%n@%m%k %B%F%{$fg[blue]%}%1~ %# %b%f%k"
  fi
fi

### Key bindings
bindkey "\e[H" beginning-of-line  # Home
bindkey "\e[F" end-of-line        # End
bindkey "\e[2~" overwrite-mode    # Insert
bindkey "\e[3~" delete-char       # Delete

### Aliases
# System
alias egrep="egrep --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
# My own
alias genpass='tr -dc A-Za-z0-9 < /dev/urandom | head -c 16 | xargs'
alias sus='sudo su -'
alias update-zshrc='wget -q https://raw.github.com/scrill/misc/master/.zshrc -O ~/.zshrc && echo "done"'
