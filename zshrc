###################
###   .zshrc    ###
###by Jan Beinke###
###################


# Feel free to use, change and create more,
# I would also encourage you to report me
# any bugs or problems, you have with this.

# This file comes with abolutely no warrenty,
# and it is provided as-is.


# Now, let's come to the good stuff:


###############
###Autoloads###
###############

# want to use regex later on
autoload -U regexp-replace


#############
###Globals###
#############

# the path should be set correctly
export PATH=~/.local/bin:~/bin:${PATH}

## Editor
# provide a range of fallbacks
                              export EDITOR="vi"
hash nano  >/dev/null 2>&1 && export EDITOR="nano"
hash vim   >/dev/null 2>&1 && export EDITOR="vim"
hash emacs >/dev/null 2>&1 && export EDITOR="emacs -nw"


#############
###Options###
#############

# flow control semms kinda strange, we don't need that
unsetopt flow_control


#################
###Keybindings###
#################

# create table of all keys.
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}


###################
###Command Propt###
###################

function command_prompt_init() {

	local color=true
	local unicode=true

  #
	local static_left="%(!.%F{red}.%F{green})%n%f@%F{yellow}%m%f:%~/"
	local static_left_noc=${static_left}
	regexp-replace static_left_noc '%([fb]|[FB]\{\w+\})' ''

	if ! ${color}; then
		static_left=${static_left_noc}
  fi

	# PS1 to fall back
	export PS1="[${static_left}] $ %E"
	
	export PSL1="┌─[${static_left}]"
	export PSL2="│ $ %E"

	export PROMPT=${PSL1}$'\n'${PSL2}

	function precmd() {
    local expandedPrompt="$(print -P "$NPS1")"
    local promptLength="${#expandedPrompt}"
    PS2="> "
    PS2="$(printf "%${promptLength}s" "$PS2")"
		#echo $promptLength
	}

}

command_prompt_init
