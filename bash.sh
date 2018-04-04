tput civis  # makes the cursor invisible
tput cnorm  # makes the cursor visible again

ag --ignore dirname pattern

ctags -R --exclude=pattern .

ssh-keygen -R "hostname"  # removes hostname from ~/.ssh/known_hosts
