export PROMPT_COMMAND='fc -ln -1 | xargs echo -e "$(date)\t$PWD\t" >> ~/cmds'
export PATH=$PATH:~/scaffold/sh

alias redis="redis-cli"

echo Welcome, ${USER}@. I have sourced your bashrc.

