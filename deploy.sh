#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project
# You may need to use some of the below options:
#   * -b=http://<your-username>.github.io/<your-project>
#   * --theme=<your-theme-name>
#   * --buildDrafts   # include drafts
#   * -d=<static-pages-dir>
#   * -v   # verbose
#
# Example: hugo -b=http://quandrei.github.io/ --theme=hugo-steam-theme --buildDrafts -d=public/ -v
hugo 

cd public    # Go To Public folder
git add -A   # Add changes to git.

# Commit changes.
msg="rebuilding site `date +\"%Y-%m-%dT%H:%M:%S %Z\"`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin master   # Push source and build repos.

cd ..   # Come Back