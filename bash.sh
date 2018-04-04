tput civis  # makes the cursor invisible
tput cnorm  # makes the cursor visible again

ag --ignore dirname pattern

ctags -R --exclude=pattern .

ssh-keygen -R "hostname"  # removes hostname from ~/.ssh/known_hosts

change_hostname() {
  sudo -s
  vi /etc/hostname  # replace line with the hostname you want (ie: staging)
  vi /etc/hosts  # add the hostname to the 127.0.0.1
  hostname staging
  exit  # don't need to be superuser anymore
}
