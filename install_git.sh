sudo apt-get install git
echo "Enter global git username"
read user
echo "Enter global git email"
read email

git config --global user.name \"$user\"
git config --global user.email $email
git config --global credential.helper store


