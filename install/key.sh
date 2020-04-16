echo Install Key...
x=$(cat)


echo "$x" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/id_rsa.pub

echo Done
