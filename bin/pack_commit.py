#!/use/bin/env python

import os
import sh

repo_dir = "/home/proudzhu/workspace/awesome/"
commit_id = "4bd5b1940dbfb7d8275cc8a55b870b5fde55ebfc"


git = sh.git.bake(_tty_out=False, _cwd=repo_dir)

filelist = git("diff-tree", "--no-commit-id", "--name-status", "-r", commit_id);

filedict = dict()
for file in filelist:
    mode, filename = file.split()
    filedict[filename] = mode

# perpare dirs
dest_filename = '/tmp/' + commit_id + '.tar.gz'
dest_dir = '/tmp/' + commit_id;
dest_dir_new = dest_dir + '/new/';
dest_dir_old = dest_dir + '/old/';

sh.mkdir('-p', dest_dir)
sh.mkdir('-p', dest_dir_new)
sh.mkdir('-p', dest_dir_old)

# backup old commit id
backup_commit_id = git('rev-parse', 'HEAD')
print(backup_commit_id)

# first stash here
stash_succeed = False
if git.stash('save') == "No local changes to save":
    stash_succeed = True

# check commit new
git.checkout(commit_id)

# save new files
for filename in filedict.keys():
    if filedict[filename] != 'D':
        (filepath, _) = os.path.split(filename)
        sh.mkdir('-p', dest_dir_new + filepath)
        sh.cp(repo_dir + filename, dest_dir_new + filename)


# check commit old
git.checkout('HEAD~1')

# save old files
for filename in filedict.keys():
    if filedict[filename] != 'A':
        (filepath, _) = os.path.split(filename)
        sh.mkdir('-p', dest_dir_old + filepath)
        sh.cp(repo_dir + filename, dest_dir_old + filename)

# tar
sh.tar('-czvf', dest_filename, '-C', '/tmp', commit_id)

# backup to origin state
print(backup_commit_id)
git.checkout(backup_commit_id)

if stash_succeed == True:
    git.stash('pop')
