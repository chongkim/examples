```bash
starting_tmux() {
  tmux
  tmux new -s session_name
}

connecting_to_session() {
  tmux attach
  tmux a
  tmux a -t session_name
}

multiple_users() {
  tmux -S /tmp/socketname new -s sessions_name
  chmod o+rwx /tmp/socketname

  tmux -S /tmp/socketname a -t session_name
  tmux -S /tmp/socketname a -t session_name -r  # if you want be read-only
}
```bash
