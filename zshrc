# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -e
# End of lines configured by zsh-newuser-install

export TERM=xterm-256color
export DEFAULT_USER=scomip
export ZPLUG_HOME=$ZDOTDIR/zplug

alias ya=$HOME/arcadia/ya
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -l"
alias py="ipython"

source $ZPLUG_HOME/init.zsh
zplug "agnoster/agnoster-zsh-theme", as:theme
zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load
