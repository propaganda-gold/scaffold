export PROMPT_COMMAND='fc -ln -1 | xargs echo -e "$(date)\t$PWD\t" >> ~/cmds'
export PATH=$PATH:~/scaffold/sh
source /home/greg/.bazel/bin/bazel-complete.bash

alias d="git diff"
alias i=vim
alias g=git
alias redis="redis-cli"

alias bb="burn build"
alias bt="burn test"

echo Welcome, ${USER}@. I have sourced your bashrc.

