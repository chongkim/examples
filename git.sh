put_existing_repository_to_github() {
  # Create the repository on github without adding files (e.g. README)
  git init
  git add .
  git commit -m 'initial commit'
  git remote add origin git@github.com:chongkim/examples.git
  git push -u origin master
}
