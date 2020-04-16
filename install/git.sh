echo Configuring git details..
echo
echo Legal Name:
read fullName
git config --global user.name "${fullName}"

echo
echo Email Address:
read emailAddress
git config --global user.email "${emailAddress}"
