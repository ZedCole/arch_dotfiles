#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load Alias Commands
if [[ -e $HOME/.bash_aliases ]]; then
        source $HOME/.bash_aliases
fi

# Load Function Commands
if [[ -e $HOME/.bash_functions ]]; then
        source $HOME/.bash_functions
fi

####
# Bash Promt
####

# Symbols and default status
final_prompt=" » "
git_sym=" "

is_git_repo () {
        git rev-parse --is-inside-work-tree 2>/dev/null
}

parse_git_branch () {
        git branch --show-current 2>/dev/null
}

# Prompt Function
_set_prompt () {
        # Set default git string
        git_branch=""

        local RED="\033[0;31m"
        local GREEN="\e[0;32m"
        local YELLOW="\033[0;33m"
        local NOCOLOUR="\033[0m"

        local git_colour="${GREEN}"

        local git_status=$(git status 2>/dev/null | grep "Your branch is ahead" 2>/dev/null)
        if [ "$git_status" != "" ]
        then
                git_colour="${YELLOW}"
        fi

        local git_status=$(git status --porcelain 2>/dev/null)
        if [ "$git_status" != "" ]
        then
                git_colour="${RED}"
        fi

        if [ "$(is_git_repo)" == "true" ]
        then
                git_branch="$git_colour$git_sym$(parse_git_branch)${NOCOLOUR}"
        fi

        PS1="\u@\h \w $git_branch \n$final_prompt"
}

PROMPT_COMMAND=_set_prompt

####
# Ruby Gems
####

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

export PATH="$HOME/dots/bin:$PATH"

