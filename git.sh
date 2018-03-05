put_existing_repository_to_github() {
  # Create the repository on github without adding files (e.g. README)
  git init
  git add .
  git commit -m 'initial commit'
  git remote add origin git@github.com:chongkim/examples.git
  git push -u origin master
}

global_config() {
  git config --global alias.co checkout
  git co master  # will do `git checkout master`
}

rebase() {
  # only do this on your own private branch
  git rebase other_branch
  git push -f
}
