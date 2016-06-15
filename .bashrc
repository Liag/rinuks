#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --group-directories-first --color=auto'
alias ll='LC_COLLATE=C ls -alF'
alias update='~/.update.sh'
alias getip='~/.getip.sh'
PS1="\[\033[38;5;199m\]\u\[$(tput sgr0)\]\[\033[38;5;255m\] @ \[$(tput sgr0)\]\[\033[38;5;36m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;116m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$\[$(tput sgr0)\] "

SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
