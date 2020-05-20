export PROMPT_COMMAND='fc -ln -1 | xargs echo -e "$(date)\t$PWD\t" >> ~/cmds'
export PATH=$PATH:~/scaffold/tools:~/forklift/sh:~/go/bin

echo Welcome, ${USER}@. I have sourced your bashrc.
source /usr/local/lib/bazel/bin/bazel-complete.bash

alias i=vim

export FZF_DEFAULT_COMMAND="ag -g ''"
