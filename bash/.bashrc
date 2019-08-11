HISTSIZE=10000
HISTFILESIZE=20000

export LC_ALL="en_US.UTF-8"  
export LANG="en_US.UTF-8"

# Keep bash history between sessions
export PROMPT_COMMAND='history -a; history -r'

# Append to the history file, don't overwrite it
shopt -s histappend

export TERM=screen-256color 

shopt -s dotglob # Make mv move hidden files
shopt -s cdable_vars
# export EDITOR='nvim'
export EDITOR='vim'

export dot="$HOME/dotfiles"

# Global aliases
alias cl="clear"

alias la='ls -A'

alias git='LC_ALL=en_GB git'
alias gs="git status"
alias gl="git pull"
alias gh="git log --oneline | head -n"
alias com="git checkout master"
alias co="git checkout"

alias v="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"

# Taskwarrior
alias ti='task add due:tomorrow tag:inbox'
alias t='task'

[ -n "$TMUX" ] && export TERM=screen-256color

# Functions
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]ruslan\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;32m\]\$(parse_git_branch) \[\033[01;34m\]\$\[\033[00m\] "

## Show only 2 parts of path
PROMPT_DIRTRIM=2


# Load local bashrc configuration
if [[ -e ~/.bashrc.local ]]; then
  source ~/.bashrc.local
fi

# Plugins
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS="--bind up:preview-page-up,down:preview-page-down"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:$HOME/.trigger"
