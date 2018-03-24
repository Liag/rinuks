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
        env LC_COLLATE=C ls --group-directories-first --color -alhF $argv | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf("%0o ",k);print}'
end

function irc --description "connect to server and attach to weechat tmux"
	start_agent
	ssh isa -t tmux attach -t irc
end

function hathlog
	start_agent
	ssh isa -t hathlog -f
end

function sshisa
	start_agent
	ssh isa
end

function syns --description "Start synergy server"
	synergys -f --enable-crypto
end

function synyr --description "Start synergy client and connect to yr"
	synergyc -f --enable-crypto yr
end

function gitssh --description 'Add git ssh key'
	start_agent_git
end

function pixivutil
	python2 /home/v/prog/PixivUtil2/PixivUtil2.py
end

function sortpixiv
	/home/v/bin/sortpixiv.sh
end

function smi
	sudo make install
end

#start_agent

# start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
#        exec startx -- -keeptty
#    end
#end

