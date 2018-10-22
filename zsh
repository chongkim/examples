```bash
set_path_unique() {
  # $PATH is tied to the $path array.  Need to set path to have unique values
  typeset -U path
  # if value exists, it will be moved to the new location
  path+=(~/bin)  # put it at the end
  path[1,0]=~/projects/bin # put it as the beginning
}
```
