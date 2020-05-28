if [ -z "$1" ]
then
	echo "Please provide a SITE_NAME"
	exit 1
fi

SITE_NAME="${1}"

sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install python-certbot-nginx
sudo certbot --nginx -d ${SITE_NAME}
