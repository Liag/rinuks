env -i HOME=$HOME dash -l -c printenv | sed -e '/PWD/d; /PATH/s/:/ /g;s/=/ /;s/^/set -x /' | source

set fish_greeting

#touhourmssay
if status --is-login
	cat ~/prog/rinuks/arch_logo.txt
#else
#	start_agent
end

function ls --description 'List contents of directory'
	set -l param --color=auto 
		if isatty 1
			set param $param --indicator-style=classify
		end 
		command ls --group-directories-first $param $argv 
end

function ll --description 'List contents of directory using long format'
        env LC_COLLATE=C ls --group-directories-first --color=auto -alhF $argv
end

function gitssh --description 'Add git ssh key'
	ssh-add ~/.ssh/id_rsa
end

#start_agent

# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
