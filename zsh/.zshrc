autoload colors
autoload -U compinit
compinit
colors

#Change default shell
alias zshDefault="chsh -s /usr/bin/zsh"
alias bashDefault="chsh -s /usr/bin/bash"

# multiple terms all add to history incrementally
# (sometimes annoying, sometimes not...)
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY

setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt EXTENDED_GLOB 
setopt PROMPT_SUBST

umask 022
limit coredumpsize 0    # Turn off core dumps

alias ls="ls --color=auto --file-type" # color ls is cool
alias grep="grep --color=auto" # color grep is cooler

if [[ "$TERM" == "screen" ]]; then
	PR_STITLE=$'%{\ekzsh\e\\%}'
else
	PR_STITLE=''
fi

# add info to screen's title when the prompt is printed
preexec () {
	print -nP "%b"
	if [[ "$TERM" == "screen" ]]; then
		typeset -a cmdstring
		cmdstring=${(z)1}
		CMD=${cmdstring[0]}
		echo -ne "\ek$CMD\e\\"
	fi
}
export PROMPT="$PR_STITLE%B%(?.. %{$fg[red]%}<%?> )%{$fg[green]%}%n@%m %{$fg[blue]%}%~ %{$fg[white]%}> "

# sometimes I like to keep a history
export SAVEHIST=2000
export HISTFILE="$HOME/.zsh_files/history"
export SHELL=`which zsh`
export EDITOR=vim
export VISUAL=vim
export CVS_RSH=ssh

# Java doesn't like dwm much...
export AWT_TOOLKIT=MToolkit

export LESS='-RMSiq'     # set up the parameters for 'less'
export PAGER=less       # use less for stuff (such as man)

setopt NO_HUP           # make jobs not die when terminal is closed

[[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" delete-char
[[ -z "$terminfo[khome]" ]] || bindkey -M emacs "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey -M emacs "$terminfo[kend]" end-of-line
# page-up/down for incremental history search
[[ -z "$terminfo[kpp]" ]] || bindkey -M emacs "$terminfo[kpp]" history-beginning-search-backward
[[ -z "$terminfo[knp]" ]] || bindkey -M emacs "$terminfo[knp]" history-beginning-search-forward

bindkey -e

_comp_options+=(globdots) # With hidden files
source /my/path/to/zsh/completion.zsh

# fancy completion stuff
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh_files/cache_$HOST

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command' 

zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.~*~' \
  '*?.class' '*?.swp' '*?.obj'

zstyle ':completion:*:functions' ignored-patterns '_*'
	
# SSH Completion (complete from hosts files, .ssh/config,known_hosts lists, etc)
zstyle ':completion:*:scp:*' tag-order \
   files 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host hosts-ipaddr

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

autoload -Uz compinit
compinit

setopt no_beep
setopt no_hup
setopt no_check_jobs
setopt no_bg_nice
setopt no_menu_complete
setopt no_auto_menu
setopt no_no_match
setopt no_auto_remove_slash
setopt complete_in_word
setopt hist_ignore_all_dups
setopt rm_star_silent

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
miniconda() {
    __conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}

