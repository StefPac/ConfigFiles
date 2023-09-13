if [ -f $HOME/.profile ]; then
    . $HOME/.profile
fi

if [ $TERM = tramp ]; then
        unset RPROMPT
        unset RPS1
        PS1="$ "
        unsetopt zle
        unsetopt rcs  # Inhibit loading of further config files
fi

if [[ "$TERM" == "dumb" ]]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unsetopt rcs  # Inhibit loading of further config files
    PS1='$ '
# unfunction precmd
#    unfunction preexec
fi

