Starting tmux
```bash
  tmux
  # or
  tmux new -s session_name
```

Connecting to session
```bash
  tmux attach
  # or
  tmux a
  # or
  tmux a -t session_name
```

Multiple users
```bash
  tmux -S /tmp/socketname new -s sessions_name
  chmod o+rwx /tmp/socketname

  tmux -S /tmp/socketname a -t session_name
  tmux -S /tmp/socketname a -t session_name -r  # if you want be read-only
```

Set the terminal environment
```
  cat >> ~/.tmux.conf<<END
set -g default-terminal "xterm-256color"
END
```
