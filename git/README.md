# Git

> Never a big thing for me. - Linus Torvalds

---

## Configuration

Git's command-line needs to be configured before use.

```bash
git config --global user.name "Your Name"
git config --global user.email "email@email.com"
```

You may list all config values with:

```bash
git config --list
```

## Creating a Repository

Before creating a branch, you can specify the default initial branch name with
the following command:

```bash
git config --global init.defaultBranch "branchname"
```

To create a new folder with a fresh repository in it, run:

```bash
git init folder_name
```

## Tracking and Recording Changes

Add a file to the staging area:

```bash
git add file_name.ext
```

Show the current status of your repository (including unstaged changes,
untracked files, and modified files):

```bash
git status
```

Show changes between the working directory and the staging area:

```bash
git diff
```

Create a commit using the staged changes:

```bash
git commit -m "The commit message"
```

## Inspecting History

Print the commit history of the current branch:

```bash
git log
```

Print the commit history in compact format:

```bash
git log --oneline
```

Render the commit history as an ASCII graph:

```bash
git log --graph
```

Search for commits in `main` using the *pickaxe* (a search string) and show the
full diff of each commit (using `--patch`):

```bash
git log --patch -S 'search_term' main
```

Perform a *pickaxe* search from before on `main`, but use a regular expression:

```bash
git log --patch --pickaxe-regex -S 'search_term' main
```

Show commits made by a given author:

```bash
git log --author="Johnny Appleseed"
```

Show commits from a given timespan:

```bash
git log --since="2 weeks ago" --until="2025-06-19"
```

Print the commit history of a specific branch:

```bash
git log branch_name
```

Print the commit history of a single file, including renames:

```bash
git log --follow file_name.ext
```

Show changes and details about the current commit:

```bash
git show
```

Show details about the provided commit, including changes:

```bash
git show commit
```

Show which commits modified a given file:

```bash
git blame file_name.ext
```

## Managing Tags

List all tags:

```bash
git tag
```

Create a lightweight tag at the current commit:

```bash
git tag tag_name
```

Create a lightweight tag at the provided commit:

```bash
git tag tag_name commit
```

Create an annotated tag at the current commit with a message:

```bash
git tag -a tag_name -m "Message content"
```

## Comparing Commits

Show changes between two commits:

```bash
git diff <commit_1> <commit_2>
```

For example, show the difference between the latest commit and the one before
it:

```bash
git diff HEAD~1 HEAD
```

Or, show the difference between the latest commit and the current directory:

```bash
git diff HEAD
```

## Resetting Changes

Discard changes made to a file and revert it back to the state it was in the
latest commit:

```bash
git checkout -- file_name.ext
```

Move back one commit from the latest, deleting all changes in the staging and
working directories:

```bash
git reset --hard HEAD~1
```

Create a commit to undo the changes created by the provided commit:

```bash
git revert commit
```

Undo the changes created by the provided commit, without creating a new commit:

```bash
git revert --no-commit commit
```

Cherry-pick (copy a commit from another branch and bring it to the current
branch without a merge:

```bash
git cherry-pick other_branch_commit
```

## Managing Branches

List all branches:

```bash
git branch
```

Create a new branch:

```bash
git branch branch_name
```

Delete a branch:

```bash
git branch -d branch_name
```

Switch to a branch:

```bash
git checkout branch_name
```

Create a branch and switch to it:

```bash
git checkout -b branch_name
```

## Handling Remote Branches

Pull changes from a remote repository:

```bash
git fetch
```

Fetch changes from the remote repository and merges them into the current
branch:

```bash
git pull
```

List remote branches from `origin`:

```bash
git remote show origin
```

List remote branches alongside their commit hashes:

```bash
git ls-remote
```

Create a local branch that tracks a remote branch:

```bash
git checkout --track origin/my-remote-branch
```

This creates a local branch named `my-remote-branch` which tracks the remote
branch of the same name.
