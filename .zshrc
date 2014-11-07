###################
###   .zshrc    ###
###by Jan Beinke###
###################


#Feel free to use, change and create more,
#I would also encourage you to report me
#any bugs or problems, you have with this.

#This file comes with abolutely no warrenty,
#and it is provided as-is.


#Now, let's come to the good stuff:


#############
###Globals###
#############

#the path should be set correctly
export PATH=~/.local/bin:~/bin:$PATH

## Editor
#provide a range of fallbacks
                              export EDITOR="vi"
hash nano  >/dev/null 2>&1 && export EDITOR="nano"
hash vim   >/dev/null 2>&1 && export EDITOR="vim"
hash emacs >/dev/null 2>&1 && export EDITOR="emacs -nw"


#############
###Options###
#############

#flow control semms kinda strange, we don't need that
unsetopt flow_control


#################
###Keybindings###
#################

#create table of all keys.
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

##PS1
export PS1="$USER@$HOST:$(pwd) $ "

##Powerline
#get the powerline path
powerline_path=$(/bin/env python3 -c 'import pkgutil;import os;print(os.path.dirname(pkgutil.get_loader("powerline").path))' 2>/dev/null)

#check if powerline ist present
if [[ "$powerline_path" != "" && $(hash powerline >/dev/null 2>&1; echo $?) == 0 ]]; then
  #source the binding, this overwrites PS1
  source $powerline_path/bindings/zsh/powerline.zsh
fi

#remove all the dirtiness
unset powerline_path
