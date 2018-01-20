#!/data/data/com.termux/files/usr/bin/env bash

#njj START
export PATH=$HOME/.local/bin:$HOME/bin:$PATH:$HOME/go/bin
export MANPATH=$HOME/share/man:$HOME/.local/share/man:$MANPATH
export TMPDIR="/data/data/com.termux/files/tmp"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
# If set, bash attempts spelling correction on directory names during word
# completion if the directory name initially supplied does not exist.
shopt -s dirspell
# If set, bash includes filenames beginning with a `.'  in the results of
# pathname expansion.
# shopt -s dotglob 
# If set, the extended pattern matching features described under Pathname
# Expansion are enabled.
#  ?(pattern-list) -- Matches zero or one occurrence
#  *(pattern-list) -- Matches zero or more occurrences
#  +(pattern-list) -- Matches one or more occurrences
#  @(pattern-list) -- Matches one
#  !(pattern-list) -- Matches anything except one
shopt -s extglob

# append to the history file, don't overwrite it
shopt -s histappend

# Why isn't bash-it handling this?
case "$TERM" in
    screen*)
        # PS1='\A \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[31m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
        function settitle() { echo -n -e '\033k'"$@"'\033\0134'; }
        PROMPT_COMMAND='settitle ${USER}@${HOSTNAME}:${PWD/$HOME/\~}'
esac

set sbr=+\ 
#njj END

# Path to the bash it configuration
export BASH_IT="/data/data/com.termux/files/home/git/bash-it"

# Lock and Load a custom theme file
# location $BASH_IT/themes/$BASH_IT_THEME (if a theme name)
# or $BASH_IT_THEME (if a file path)
export BASH_IT_THEME='powerline-plain'

#njj
export POWERLINE_PROMPT_USER_INFO_MODE="sudo"

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
#njj export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
#njj export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# For big repositories, ignoring *untracked* files can make git faster.
export SCM_GIT_IGNORE_UNTRACKED=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true 
# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
