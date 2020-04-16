#
# Run ssh with:
#  1) standard key
#  2) 'ubuntu' as the user

REQUEST_HOSTNAME=$1

if [ -z "$REQUEST_HOSTNAME" ]
then
	echo "Usage: aws-ssh.sh [hostname]"
	exit 1
fi

ssh -i ~/Downloads/aws-key-jan2020-1.pem ubuntu@${REQUEST_HOSTNAME}
