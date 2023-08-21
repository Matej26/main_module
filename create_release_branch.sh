git fetch origin dev
git checkout dev
git pull origin dev
current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

git diff master --quiet
diff_exit_code=$?

if [ "$current_branch" == "dev" ]; then
    if [ "$diff_exit_code" == 1 ]; then
      git checkout -b release/"$1"
      git push origin head
    else echo "There is no diff between dev and master"
    fi
else echo "Current branch is not dev"
fi
