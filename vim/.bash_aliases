alias e=vim
alias blaze=bazel
export PROMPT_COMMAND='fc -ln -1 | xargs echo -e "$(date)\t$PWD\t" >> ~/cmds'
export PATH=$PATH:~/go/bin:~/live/sh
alias ll='less /log'
source /home/greg/.bazel/bin/bazel-complete.bash

echo Welcome, ${USER}@. I have sourced your bashrc.
