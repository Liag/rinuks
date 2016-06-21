env -i HOME=$HOME dash -l -c printenv | sed -e '/PWD/d; /PATH/s/:/ /g;s/=/ /;s/^/set -x /' | source

set fish_greeting

#touhourmssay
if status --is-login
	cat ~/prog/rinuks/arch_logo.txt
end

function ls --description 'List contents of directory'
	set -l param --color=auto 
		if isatty 1
			set param $param --indicator-style=classify
		end 
		command ls --group-directories-first $param $argv 
end

function ll --description 'List contents of directory using long format'
        env COLLATE=C ls --group-directories-first --color=auto -alhF $argv
end

start_agent
