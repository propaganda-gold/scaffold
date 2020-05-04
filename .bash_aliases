export PROMPT_COMMAND='fc -ln -1 | xargs echo -e "$(date)\t$PWD\t" >> ~/cmds'
export PATH=$PATH:~/scaffold/tools:~/forklift/sh:~/go/bin

echo Welcome, ${USER}@. I have sourced your bashrc.
