```bash
put_existing_repository_to_github() {
  # Create the repository on github without adding files (e.g. README)
  git init
  git add .
  git commit -m 'initial commit'
  git remote add origin git@github.com:chongkim/examples.git
  git push -u origin master
}

delete_remote_branch() {
  git push -d origin branchname
}

delete_remote_branch_old_method() {
  git push origin :branchname
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

cherry_pick() {
  git cherry-pick other_branch   # => only get last commit from other_branch
  git cherry-pick ..other_branch # => gets all commits from other branch
  git cherry-pick ...other_branch
  git cherry-pick other_branch...

  git cherry-pick 23185eb e321960 4a794cf # pick up all three

  git cherry-pick 23185eb..4a794cf # pick up except for first
  git cherry-pick 23185eb...4a794cf # pick up except for first
}

bisect() {
  git bisect start
  git bisect bad # mark current version as bad
  git bisect good develop # mark this as good, will automatically checkout middle commit

  git bisect good # or bad continue checking out the middle commit

  git bisect reset # done
}

rename_branch() {
  git branch -m new-name
  git branch -m old-name new-name

  git push origin :old-name new-name
  git push origin -u new-name
}

common_ancestor() {
  git merge-base branch1 branch2
}
```
