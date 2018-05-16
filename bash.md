```bash
tput civis  # makes the cursor invisible
tput cnorm  # makes the cursor visible again
```

```bash
ctags -R --exclude=pattern .
```

```bash
ssh-keygen -R "hostname"  # removes hostname from ~/.ssh/known_hosts
```

```bash
change_hostname() {
  sudo -s
  vi /etc/hostname  # replace line with the hostname you want (ie: staging)
  vi /etc/hosts  # add the hostname to the 127.0.0.1
  hostname staging
  exit  # don't need to be superuser anymore
}
```

```bash
filename = 'foo.tar.gz'
echo ${filename##*.}  # removes everything (greedy) before the .
# => 'gz'
echo ${filename#.}  # removes everything (shortest) before the .
# => 'tar.gz'
echo ${filename%.*}
# => 'foo.tar'
echo ${filename%%.*}
# => 'foo'
```
