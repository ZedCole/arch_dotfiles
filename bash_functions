#
# ~/.bash_functions
#

###
# File System
###

# Move to Directory and List Contents
function cl() {
        cd "$@" && \
        ls -F --color=auto
}
