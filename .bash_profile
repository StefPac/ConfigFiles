# Add X11 
export PATH=${PATH}:/opt/X11/bin/

# Add MacTex
export PATH=${PATH}/usr/local/texlive/2015/bin/x86_64-darwin

# History
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
# from http://askubuntu.com/a/673283
PROMPT_COMMAND='history -a; history -n;'

