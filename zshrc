source $XDG_DATA_HOME/zinit/bin/zinit.zsh

HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt AUTO_MENU
setopt PROMPT_SUBST
setopt COMPLETE_ALIASES

bindkey -e

export DEFAULT_USER=scomip

fpath+=$ZDOTDIR/zfunc

zinit load agnoster/agnoster-zsh-theme
zinit wait lucid for \
    as=completion @OMZP::cargo/_cargo \
    as=completion @OMZP::pip/_pip \
    atinit="zicompinit; zicdreplay" \
        @zdharma/fast-syntax-highlighting
zinit wait lucid for \
    @OMZP::colored-man-pages

autoload edit-command-line; zle -N edit-command-line

# load fzf
source "${XDG_CONFIG_HOME:-$HOME/.config}/fzf/fzf.zsh"
export FZF_DEFAULT_COMMAND="fd --type f"

# falcon colorscheme
export EXA_COLORS="uu=38;5;249:un=38;5;241:gu=38;5;245:gn=38;5;241:da=38;5;245:sn=38;5;7:sb=38;5;7:ur=38;5;3;1:uw=38;5;5;1:ux=38;5;1;1:ue=38;5;1;1:gr=38;5;249:gw=38;5;249:gx=38;5;249:tr=38;5;249:tw=38;5;249:tx=38;5;249:fi=38;5;248:di=38;5;253:ex=38;5;1:xa=38;5;12:*.png=38;5;4:*.jpg=38;5;4:*.gif=38;5;4"

bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word
bindkey '^O' edit-command-line

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias ya=$HOME/arcadia/ya
# alias ls="exa --group-directories-first"
# alias ll="exa --group-directories-first -l"
# alias la="exa --group-directories-first -a"
alias py="ipython2"
alias diff="diff --color=auto"
alias py3="ipython3"
alias qtools="~/tmp/qtool/node_modules/.bin/qtools"
alias ssh="TERM=xterm-256color ssh"

export PYENV_ROOT="$HOME/.local/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init - --no-rehash)"
fi
