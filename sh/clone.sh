REPO=$1

if [ -z "${REPO}" ]
then
	echo "Usage: clone.sh repo-name"
	exit 1
fi

git clone git@github.com:propaganda-gold/${REPO}.git
