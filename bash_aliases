#
# ~/.bash_aliases
#

###
# File System
###

# List Files / Folders
alias ls='ls -F --color=auto'

# Show Hidden Files / Folders
alias la='ls -a'

# List Files Permissions and File Size
alias ll='ls -lh'

# List Hidden Files Permissions and File Sizes
alias lla='ls -lha'

# Go up one directory
alias cd.='cd ..'

# List Sorted by File Size
alias lt='ls --human-readable --size -1 -S --classify'

# List Sorted by Modified Time
alias left='ls -t -1'

# Count Number of Files in Directory
alias count='find . -type f | wc -l'

# Move File to Trash
alias tcn='mv --force -t ~/.local/share/Trash '

# Move to Dev Directory
alias cdev='cl /mnt/Storage/Projects/Development'

# Move to Learning Directory
alias clearn='cl /mnt/Storage/Learning'

###
# Git
###

# Move to top level of Git Project
alias cg='cd `git rev-parse --show-toplevel`'

# Git Status
alias gstat='git status'

###
# Python
###

# Create a python virtual environment
alias ve='python3 -m venv ./venv'

# Start python virtual environment
alias va='source ./venv/bin/activate'

###
# Misc
###

# Seach command History
alias gh='history|grep'

# Read File Ignoring Comments
alias decomment='egrep -v "^[[:space:]]*((#|;|//).*)?$"'

# Clear console
alias c='clear'

